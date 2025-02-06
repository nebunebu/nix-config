{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.cli-tools;
in
{
  options.neb.terminal.utilities.cli-tools = {
    enable = lib.mkEnableOption "enable cli-tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        nerdfix
        usbutils
        pup
        # bottom
        # ffmpeg
        # distrobox
        ;
    };
  };
}
