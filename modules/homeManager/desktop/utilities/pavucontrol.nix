{ lib, config, pkgs, ... }:
let
  cfg = config.desktop.utilities.pavucontrol;
in

{
  options.desktop.utilities.pavucontrol = {
    enable = lib.mkEnableOption "enable pavucontrol";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pavucontrol ];
  };
}
