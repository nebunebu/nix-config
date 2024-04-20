{ pkgs, ... }: {
  home.packages = [
    (pkgs.writeShellScriptBin "linkhandler" ''
      #!/run/current-system/sw/bin/bash

      if [ -z "$1" ]; then
        url="$(wl-paste)"
      else
        url="$1"
      fi

      case "$url" in
        *mkv\
       |*webm\
       |*mp4\
       |*youtube.com/watch*\
       |*youtube.com/playlist*\
       |*youtube.com/shorts*\
       |*youtu.be*\
       |*hooktube.com*\
       |*bitchute.com*\
       |*odysee.com*)
         setsid -f mpv -quiet "$url"\
         >/dev/null 2>&1
         ;;
        *png\
       |*jpg\
       |*jpe\
       |*jpeg\
       |*gif\
       |*webp)
         setsid -f mpv -quiet --loop "$url"\
         >/dev/null 2>&1
         ;;
        *pdf\
       |*cbz\
       |*cbr)
         curl -sL "$url" > "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")"\
         && sioyek "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")"\
         >/dev/null 2>&1 &
         ;;
        *mp3\
       |*flac\
       |*opus\
       |*mp3?source*)
          qndl "$url" 'curl -LO'  >/dev/null 2>&1 ;;
       *redbarradio.net/embed/vod2*)
          ;;
        *)
          # [ -f "$url" ]\
          # && setsid -f "$TERMINAL" -e "$EDITOR" "$url"\
          # >/dev/null 2>&1\
          # || setsid -f w3m "$url"\
          # >/dev/null 2>&1
          setsid -f firefox -new-window "$url"; sleep 2.5; { echo key alt+ctrl+b; } | dotool
      esac
    '')
  ];
}
