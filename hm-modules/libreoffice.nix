{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.libreoffice;
in
{
  options.hm.libreoffice = {
    enable = lib.mkEnableOption "enable libreoffice";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.libreoffice-fresh
    ];
  };
}
