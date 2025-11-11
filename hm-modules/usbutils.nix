{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.usbutils;
in
{
  options.neb.terminal.utilities.usbutils = {
    enable = lib.mkEnableOption "enable usbutils";
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        usbutils
        ;
    };
  };
}
