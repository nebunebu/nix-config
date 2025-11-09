{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.communications.vesktop;
in
{
  options.neb.desktop.communications.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.vesktop ];
  };
}
