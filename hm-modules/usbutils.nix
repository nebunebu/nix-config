{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.usbutils;
in
{
  options.opts.usbutils = {
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
