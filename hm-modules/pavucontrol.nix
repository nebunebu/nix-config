{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.desktop.pavucontrol;
in

{
  options.desktop.pavucontrol = {
    enable = lib.mkEnableOption "enable pavucontrol";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pavucontrol ];
  };
}
