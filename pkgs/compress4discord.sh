#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  compress4discord INPUT [OUTPUT]
    [--size 9.5MB] [--audio 64k] [--width 854] [--fps 30] [--preset slow]

--size supports: 10MB, 9.5MB, 9MiB, 8MiB, 8000kB
  MB/kB are decimal (1MB=1,000,000 bytes)
  MiB/KiB are binary (1MiB=1,048,576 bytes)

Defaults are tuned to stay under Discord's 10MB free limit by targeting 9.5MB
and subtracting a small overhead padding.
EOF
}

need_cmd() { command -v "$1" >/dev/null 2>&1 || {
  echo "Missing dependency: $1" >&2
  exit 1
}; }

need_val() {
  # Expects: need_val "$@"
  [[ $# -ge 2 && "${2:-}" != --* ]] || {
    echo "Missing value for $1" >&2
    usage
    exit 2
  }
}

size_to_bytes() {
  local s="$1"
  awk -v s="$s" '
    function trim(x){ gsub(/^[ \t]+|[ \t]+$/, "", x); return x }
    BEGIN {
      s = trim(s)
      match(s, /^([0-9]*\.?[0-9]+)([A-Za-z]+)$/, m)
      if (!m[1]) { print "ERR"; exit 1 }
      n = m[1] + 0
      u = m[2]

      if      (u=="B")   mult=1
      else if (u=="kB")  mult=1000
      else if (u=="MB")  mult=1000*1000
      else if (u=="GB")  mult=1000*1000*1000
      else if (u=="KiB") mult=1024
      else if (u=="MiB") mult=1024*1024
      else if (u=="GiB") mult=1024*1024*1024
      else if (u=="K" || u=="k") mult=1000
      else if (u=="M")   mult=1000*1000
      else { print "ERR"; exit 1 }

      printf "%.0f\n", n*mult
    }'
}

# ---- args ----
in="${1:-}"
[[ -z "${in}" || "${in}" == "-h" || "${in}" == "--help" ]] && {
  usage
  exit 0
}
shift

out=""
if [[ $# -gt 0 && "${1:-}" != --* ]]; then
  out="$1"
  shift
fi

target_size="9.5MB"
audio_rate="64k"
max_width="854"
fps="30"
preset="slow"

while [[ $# -gt 0 ]]; do
  case "$1" in
  --size)
    need_val "$@"
    target_size="$2"
    shift 2
    ;;
  --audio)
    need_val "$@"
    audio_rate="$2"
    shift 2
    ;;
  --width)
    need_val "$@"
    max_width="$2"
    shift 2
    ;;
  --fps)
    need_val "$@"
    fps="$2"
    shift 2
    ;;
  --preset)
    need_val "$@"
    preset="$2"
    shift 2
    ;;
  *)
    echo "Unknown arg: $1" >&2
    usage
    exit 2
    ;;
  esac
done

if [[ -z "$out" ]]; then
  base="${in%.*}"
  out="${base}.discord.mp4"
fi

need_cmd ffmpeg
need_cmd ffprobe
need_cmd awk
need_cmd mktemp

target_bytes="$(size_to_bytes "$target_size")"
[[ "$target_bytes" == "ERR" ]] && {
  echo "Bad --size value: $target_size" >&2
  exit 2
}

# Padding for mp4 container overhead (200 KiB)
pad=$((200 * 1024))
if ((target_bytes > pad)); then
  target_bytes=$((target_bytes - pad))
fi

duration="$(ffprobe -v error -show_entries format=duration -of default=nk=1:nw=1 "$in")"
dur_ok="$(awk -v d="$duration" 'BEGIN { if (d+0 > 0) print "OK"; else print "ERR" }')"
[[ "$dur_ok" == "ERR" ]] && {
  echo "Could not determine a valid duration for input: $in (got: '$duration')" >&2
  exit 1
}

# Detect whether the input has an audio stream
has_audio="$(ffprobe -v error -select_streams a:0 -show_entries stream=index -of csv=p=0 "$in" 2>/dev/null || true)"

audio_kbps=0
audio_opts=()
if [[ -n "$has_audio" ]]; then
  audio_kbps="$(awk -v a="$audio_rate" 'BEGIN{
    if (a ~ /^[0-9]+k$/) { sub(/k$/, "", a); print a; exit }
    print "ERR"
  }')"
  [[ "$audio_kbps" == "ERR" ]] && {
    echo "Bad --audio value: $audio_rate (use e.g. 64k)" >&2
    exit 2
  }
  audio_opts=(-c:a aac -b:a "$audio_rate")
else
  audio_opts=(-an)
fi

total_kbps="$(awk -v bytes="$target_bytes" -v dur="$duration" 'BEGIN{
  printf "%d\n", (bytes*8)/(dur*1000)
}')"

# Safety margin (shave a few kbps to avoid boundary overshoots)
video_kbps=$((total_kbps - audio_kbps - 8))

if ((video_kbps < 50)); then
  echo "Target too tight for this duration with audio=${audio_rate}." >&2
  echo "Try: --size bigger, --audio 48k, trim, or lower --width/--fps." >&2
  exit 1
fi

tmpdir="$(mktemp -d -t ffmpeg-2pass-XXXX)"
trap 'rm -rf "$tmpdir"' EXIT
passlog="${tmpdir}/passlog"

vf="scale=w='min(${max_width},iw)':h=-2,fps=${fps}"

# pass 1 (use null muxer; mp4 to /dev/null can fail on non-seekable output)
ffmpeg -y -i "$in" \
  -vf "$vf" \
  -c:v libx264 -b:v "${video_kbps}k" -preset "$preset" \
  -pass 1 -passlogfile "$passlog" \
  -an -f null /dev/null

# pass 2
ffmpeg -y -i "$in" \
  -vf "$vf" \
  -c:v libx264 -b:v "${video_kbps}k" -preset "$preset" -pix_fmt yuv420p \
  -pass 2 -passlogfile "$passlog" \
  "${audio_opts[@]}" \
  -movflags +faststart \
  "$out"

echo "Wrote: $out"
echo "Target: ''${target_size} (minus padding), duration: ''${duration}s, video: ''${video_kbps}k, audio: ''${audio_rate}"
