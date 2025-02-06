{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.utilities.pavucontrol;
in

{
  options.neb.desktop.utilities.pavucontrol = {
    enable = lib.mkEnableOption "enable pavucontrol";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pavucontrol ];
  };
}
