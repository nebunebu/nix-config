{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.communications.discover-overlay;
in
{
  options.neb.desktop.communications.discover-overlay = {
    enable = lib.mkEnableOption "enable discover-overlay";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.discover-overlay ];
    # NOTE: toggle reserved workspace
    # hyprctl keyword monitor HDMI-A-1,addreserved,0,0,165,0
    # hyprctl keyword monitor HDMI-A-1,addreserved,0,0,0,0
  };
}
