{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.usbutils;
in
{
  options.hm.usbutils = {
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
