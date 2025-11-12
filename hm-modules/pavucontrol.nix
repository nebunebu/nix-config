{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.pavucontrol;
in

{
  options.opts.pavucontrol = {
    enable = lib.mkEnableOption "enable pavucontrol";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pavucontrol ];
  };
}
