{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.pavucontrol;
in

{
  options.hm.pavucontrol = {
    enable = lib.mkEnableOption "enable pavucontrol";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pavucontrol ];
  };
}
