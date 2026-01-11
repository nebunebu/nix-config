#!/usr/bin/env bash
set -euo pipefail

PROG="discord_dumper"
CONFIG_DEFAULT="${XDG_CONFIG_HOME:-$HOME/.config}/discord_dumper/config"

# Defaults (can be overridden by config/env/flags)
DISCORD_DUMPER_WEBHOOK="${DISCORD_DUMPER_WEBHOOK:-}"
MAX_SIZE_SPEC="${DISCORD_DUMPER_MAX_SIZE:-10MB}" # default filter
NO_SIZE_LIMIT=0
ON_LARGE="skip" # skip | fail

RECURSIVE=0
DELETE=0
DRYRUN=0
VERBOSE=0
QUIET=0

MESSAGE=""
TEXT=""

DIR=""
FILES=()

usage() {
  cat <<EOF
$PROG: upload files (or text) to Discord via webhook.

USAGE:
  $PROG [files...] [options]
  $PROG -d <dir> [options]
  $PROG -t <text> [options]

WEBHOOK SOURCES (highest priority wins):
  1) --webhook URL
  2) env: DISCORD_DUMPER_WEBHOOK
  3) config: $CONFIG_DEFAULT

COMMON OPTIONS:
  -f, --file PATH          Add a file to upload (repeatable). You can also pass files positionally.
  -d, --dir PATH           Upload each file in a directory (batch). Non-recursive by default.
  -r, --recursive          Recurse when using --dir.
  -m, --message TEXT       Message to include with each file upload (and with --text).
  -t, --text TEXT          Send a text-only message. If combined with files/--dir, acts like --message.
  -D, --delete             Delete successfully uploaded files after upload.

SIZE FILTER (defaults to 10MB):
  -S, --max-size SIZE      Max file size to upload (e.g. 10MB, 50MB, 500MB, 10485760, 10MiB).
      --no-size-limit      Disable size filtering.
      --skip-large         (default) warn + skip files over limit
      --fail-large         error + exit nonzero if any file is over limit

OTHER:
  -c, --config PATH        Config file path (default: $CONFIG_DEFAULT)
  -w, --webhook URL        Webhook URL override.
  -n, --dry-run            Print what would happen; don't call Discord.
  -v, --verbose            Print extra info (HTTP headers via curl -D -).
  -q, --quiet              Only print errors.
  -h, --help               Show help.

CONFIG FILE FORMAT:
  You can use either style (first match wins):
    webhook=https://discord.com/api/webhooks/XXX/YYY
    max_size=10MB
  or shell style:
    DISCORD_DUMPER_WEBHOOK="https://discord.com/api/webhooks/XXX/YYY"
    DISCORD_DUMPER_MAX_SIZE="10MB"

NOTES:
  - Treat the webhook URL like a password: anyone with it can post as the webhook.
  - The size limit here is just a local filter. Discord may still reject files for other reasons.
EOF
}

err() { printf '%s: %s\n' "$PROG" "$*" >&2; }
note() { [[ "$QUIET" == "1" ]] || printf '%s\n' "$*"; }

have_cmd() { command -v "$1" >/dev/null 2>&1; }

need_cmd() {
  have_cmd "$1" || {
    err "Missing dependency: $1"
    exit 1
  }
}

need_arg() {
  local opt="$1" val="${2-}"
  [[ -n "$val" ]] || {
    err "missing argument for $opt"
    exit 2
  }
}

# Prefer coreutils numfmt if available; otherwise do a simple parser.
size_to_bytes() {
  local spec="$1"
  spec="${spec//[[:space:]]/}"

  # If it's pure digits, assume bytes.
  if [[ "$spec" =~ ^[0-9]+$ ]]; then
    printf '%s\n' "$spec"
    return 0
  fi

  if have_cmd numfmt; then
    # numfmt --from=iec accepts suffixes like K, M, G, KiB, MiB, etc.
    # We treat MB as M-ish; good enough for a filter.
    numfmt --from=iec "$spec" 2>/dev/null && return 0
  fi

  # Fallback: parse like 10M / 10MB / 10MiB / 500MB / 1G etc, using 1024^n.
  local num unit
  if [[ "$spec" =~ ^([0-9]+)([KkMmGgTt])([Ii]?[Bb])?$ ]]; then
    num="${BASH_REMATCH[1]}"
    unit="${BASH_REMATCH[2]}"
  elif [[ "$spec" =~ ^([0-9]+)([Kk][Ii][Bb]|[Mm][Ii][Bb]|[Gg][Ii][Bb]|[Tt][Ii][Bb])$ ]]; then
    num="${BASH_REMATCH[1]}"
    unit="${BASH_REMATCH[2]:0:1}"
  else
    err "could not parse size: '$spec' (try 10MB, 50MB, 500MB, 10MiB, or bytes)"
    return 2
  fi

  local mul=1
  case "${unit^^}" in
  K) mul=$((1024)) ;;
  M) mul=$((1024 * 1024)) ;;
  G) mul=$((1024 * 1024 * 1024)) ;;
  T) mul=$((1024 * 1024 * 1024 * 1024)) ;;
  *) mul=1 ;;
  esac
  printf '%s\n' $((num * mul))
}

bytes_human() {
  local b="$1"
  if have_cmd numfmt; then
    numfmt --to=iec --suffix=B "$b"
  else
    printf '%sB\n' "$b"
  fi
}

trim() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf '%s' "$s"
}

load_config() {
  local cfg="$1"
  [[ -f "$cfg" ]] || return 0

  # key=value style (webhook=..., max_size=...)
  local line
  line="$(grep -E '^\s*webhook\s*=' "$cfg" 2>/dev/null | head -n1 || true)"
  if [[ -n "$line" && "$WEBHOOK_FROM_FLAG" != "1" && "$WEBHOOK_FROM_ENV" != "1" ]]; then
    DISCORD_DUMPER_WEBHOOK="$(trim "${line#*=}")"
  fi

  line="$(grep -E '^\s*max_size\s*=' "$cfg" 2>/dev/null | head -n1 || true)"
  if [[ -n "$line" && "$MAXSIZE_FROM_FLAG" != "1" && "$MAXSIZE_FROM_ENV" != "1" ]]; then
    MAX_SIZE_SPEC="$(trim "${line#*=}")"
  fi

  # shell style (parse just the two vars; do NOT source arbitrary code)
  line="$(grep -E '^\s*DISCORD_DUMPER_WEBHOOK\s*=' "$cfg" 2>/dev/null | head -n1 || true)"
  if [[ -n "$line" && "$WEBHOOK_FROM_FLAG" != "1" && "$WEBHOOK_FROM_ENV" != "1" ]]; then
    # strip leading varname=
    local rhs="${line#*=}"
    rhs="$(trim "$rhs")"
    # remove surrounding quotes if present
    rhs="${rhs%\"}"
    rhs="${rhs#\"}"
    rhs="${rhs%\'}"
    rhs="${rhs#\'}"
    DISCORD_DUMPER_WEBHOOK="$rhs"
  fi

  line="$(grep -E '^\s*DISCORD_DUMPER_MAX_SIZE\s*=' "$cfg" 2>/dev/null | head -n1 || true)"
  if [[ -n "$line" && "$MAXSIZE_FROM_FLAG" != "1" && "$MAXSIZE_FROM_ENV" != "1" ]]; then
    local rhs="${line#*=}"
    rhs="$(trim "$rhs")"
    rhs="${rhs%\"}"
    rhs="${rhs#\"}"
    rhs="${rhs%\'}"
    rhs="${rhs#\'}"
    MAX_SIZE_SPEC="$rhs"
  fi
}

post_text() {
  local content="$1"
  [[ -n "$content" ]] || {
    err "text message is empty"
    return 2
  }

  if [[ "$DRYRUN" == "1" ]]; then
    note "[dry-run] would send text: $content"
    return 0
  fi

  local curl_common=(-sS --fail)
  if [[ "$VERBOSE" == "1" ]]; then
    curl_common+=(-D - -o /dev/null)
  else
    curl_common+=(-o /dev/null)
  fi

  # Use --form-string so leading '@' isn't treated as "read from file".
  curl "${curl_common[@]}" --form-string "content=$content" "$DISCORD_DUMPER_WEBHOOK"
  note "Sent text."
}

post_file() {
  local path="$1"
  [[ -f "$path" ]] || {
    err "not a file: $path"
    return 2
  }

  local size
  size="$(stat -c '%s' -- "$path")"

  if [[ "$NO_SIZE_LIMIT" != "1" ]]; then
    if ((size > MAX_BYTES)); then
      local msg
      msg="SKIP (too large): $path ($(bytes_human "$size")) > limit $(bytes_human "$MAX_BYTES")"
      if [[ "$ON_LARGE" == "fail" ]]; then
        err "$msg"
        return 3
      else
        note "$msg"
        return 0
      fi
    fi
  fi

  if [[ "$DRYRUN" == "1" ]]; then
    if [[ -n "$MESSAGE" ]]; then
      note "[dry-run] would upload: $path (with message)"
    else
      note "[dry-run] would upload: $path"
    fi
    return 0
  fi

  local curl_common=(-sS --fail)
  if [[ "$VERBOSE" == "1" ]]; then
    curl_common+=(-D - -o /dev/null)
  else
    curl_common+=(-o /dev/null)
  fi

  local args=("${curl_common[@]}")
  if [[ -n "$MESSAGE" ]]; then
    # Use --form-string so leading '@' isn't treated as "read from file".
    args+=(--form-string "content=$MESSAGE")
  fi
  args+=(-F "file=@$path" "$DISCORD_DUMPER_WEBHOOK")

  if curl "${args[@]}"; then
    note "Uploaded: $path"
    if [[ "$DELETE" == "1" ]]; then
      rm -f -- "$path"
      note "Deleted:  $path"
    fi
    return 0
  else
    err "FAILED upload: $path"
    return 1
  fi
}

# ---- arg parsing ----
need_cmd curl
need_cmd stat
need_cmd find

CONFIG="$CONFIG_DEFAULT"

WEBHOOK_FROM_FLAG=0
WEBHOOK_FROM_ENV=0
MAXSIZE_FROM_FLAG=0
MAXSIZE_FROM_ENV=0

[[ -n "${DISCORD_DUMPER_WEBHOOK:-}" ]] && WEBHOOK_FROM_ENV=1
[[ -n "${DISCORD_DUMPER_MAX_SIZE:-}" ]] && MAXSIZE_FROM_ENV=1

while [[ $# -gt 0 ]]; do
  case "$1" in
  -f | --file)
    need_arg "$1" "${2-}"
    FILES+=("$2")
    shift 2
    ;;
  -d | --dir)
    need_arg "$1" "${2-}"
    DIR="$2"
    shift 2
    ;;
  -r | --recursive)
    RECURSIVE=1
    shift
    ;;
  -D | --delete)
    DELETE=1
    shift
    ;;

  -m | --message)
    need_arg "$1" "${2-}"
    MESSAGE="$2"
    shift 2
    ;;
  -t | --text)
    need_arg "$1" "${2-}"
    TEXT="$2"
    shift 2
    ;;

  -S | --max-size)
    need_arg "$1" "${2-}"
    MAX_SIZE_SPEC="$2"
    MAXSIZE_FROM_FLAG=1
    shift 2
    ;;
  --no-size-limit)
    NO_SIZE_LIMIT=1
    shift
    ;;
  --skip-large)
    ON_LARGE="skip"
    shift
    ;;
  --fail-large)
    ON_LARGE="fail"
    shift
    ;;

  -c | --config)
    need_arg "$1" "${2-}"
    CONFIG="$2"
    shift 2
    ;;
  -w | --webhook)
    need_arg "$1" "${2-}"
    DISCORD_DUMPER_WEBHOOK="$2"
    WEBHOOK_FROM_FLAG=1
    shift 2
    ;;

  -n | --dry-run)
    DRYRUN=1
    shift
    ;;
  -v | --verbose)
    VERBOSE=1
    shift
    ;;
  -q | --quiet)
    QUIET=1
    shift
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  --)
    shift
    # slurp the rest as positional files
    if [[ $# -gt 0 ]]; then
      FILES+=("$@")
    fi
    break
    ;;
  -*)
    err "unknown option: $1"
    usage
    exit 2
    ;;
  *)
    FILES+=("$1")
    shift
    ;;
  esac
done

# Load config (but do not override explicit --webhook / env)
load_config "$CONFIG"

if [[ -z "$DISCORD_DUMPER_WEBHOOK" ]]; then
  err "no webhook found. Use --webhook, set DISCORD_DUMPER_WEBHOOK, or create $CONFIG"
  exit 2
fi

# Basic sanity check to avoid obvious foot-guns
if [[ ! "$DISCORD_DUMPER_WEBHOOK" =~ ^https://(discord\.com|canary\.discord\.com|ptb\.discord\.com|discordapp\.com)/api/webhooks/ ]]; then
  err "webhook URL doesn't look like a Discord webhook (expected https://{discord|canary|ptb}.discord.com/api/webhooks/...)"
  exit 2
fi

# If --text combined with files/--dir, treat as --message
if [[ -n "$TEXT" && (${#FILES[@]} -gt 0 || -n "$DIR") ]]; then
  MESSAGE="$TEXT"
  TEXT=""
fi

# Compute max bytes once
if [[ "$NO_SIZE_LIMIT" != "1" ]]; then
  MAX_BYTES="$(size_to_bytes "$MAX_SIZE_SPEC")"
else
  MAX_BYTES=0
fi

# ---- execute ----
if [[ -n "$TEXT" ]]; then
  post_text "$TEXT"
  exit 0
fi

# Directory mode: batch upload each file
if [[ -n "$DIR" ]]; then
  [[ -d "$DIR" ]] || {
    err "not a directory: $DIR"
    exit 2
  }

  note "Batch upload from: $DIR"
  if [[ "$RECURSIVE" == "1" ]]; then
    note "Mode: recursive"
  else
    note "Mode: non-recursive"
  fi
  [[ "$NO_SIZE_LIMIT" == "1" ]] || note "Max size: $MAX_SIZE_SPEC (filter mode: $ON_LARGE)"

  find_args=(-- "$DIR")
  [[ "$RECURSIVE" == "1" ]] || find_args+=(-maxdepth 1)
  find_args+=(-type f -print0)

  any_fail=0
  any_too_large_fail=0

  while IFS= read -r -d '' f; do
    if post_file "$f"; then
      :
    else
      rc=$?
      if [[ $rc -eq 3 ]]; then
        any_too_large_fail=1
        [[ "$ON_LARGE" == "fail" ]] && exit 3
      else
        any_fail=1
      fi
    fi
  done < <(find "${find_args[@]}")

  [[ $any_fail -eq 0 ]] || exit 1
  [[ $any_too_large_fail -eq 0 ]] || exit 3
  exit 0
fi

# File mode (positional and/or -f). If none, show help.
if [[ ${#FILES[@]} -eq 0 ]]; then
  err "nothing to do. Provide files, or use --dir, or --text."
  usage
  exit 2
fi

[[ "$NO_SIZE_LIMIT" == "1" ]] || note "Max size: $MAX_SIZE_SPEC (filter mode: $ON_LARGE)"

any_fail=0
any_too_large_fail=0
for f in "${FILES[@]}"; do
  if post_file "$f"; then
    :
  else
    rc=$?
    if [[ $rc -eq 3 ]]; then
      any_too_large_fail=1
      [[ "$ON_LARGE" == "fail" ]] && exit 3
    else
      any_fail=1
    fi
  fi
done

[[ $any_fail -eq 0 ]] || exit 1
[[ $any_too_large_fail -eq 0 ]] || exit 3
