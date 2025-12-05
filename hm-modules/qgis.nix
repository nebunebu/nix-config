{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.qgis;
in
{
  options.hm.qgis = {
    enable = lib.mkEnableOption "enable qgis";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.qgis
    ];
  };
}
