{ lib
, config
, pkgs
, ...
}:
let
  cfg = config.neb.terminal.utilities.cli-tools;
in
{
  options.neb.terminal.utilities.cli-tools = {
    enable = lib.mkEnableOption "enable cli-tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages =
      builtins.attrValues {
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
          # invidtui
          ;
      };
  };
}
