{ pkgs, ... }:

{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      nerdfix
      usbutils
      tree
      nitch
      ripgrep-all
      jq
      pup
      fd
      # bottom
      # ripgrep
      # ffmpeg
      # yt-dlp
      # distrobox
      # lazygit
      # libnotify
      # invidtui
      ;
  };
}
