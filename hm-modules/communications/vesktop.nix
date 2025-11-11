{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.desktop.communications.vesktop;
in
{
  options.desktop.communications.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.vesktop ];
  };
}
