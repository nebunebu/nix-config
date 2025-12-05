{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.gimp;
in
{
  options.hm.gimp = {
    enable = lib.mkEnableOption "enable gimp";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.gimp-with-plugins
    ];
  };
}
