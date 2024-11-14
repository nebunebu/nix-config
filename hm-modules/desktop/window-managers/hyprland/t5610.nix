{ lib, config, ... }:
let
  cfg = config.neb.desktop.window-managers.hyprland.t5610;
in
{
  options = {
    neb.desktop.window-managers.hyprland.t5610.enable = lib.mkEnableOption "enable hyprland settings for t5610";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      monitor = [
        "DP-1, 1920x1080, 0x0, 1"
        # "DP-2, 1920x1080, 1920x0, 1"
        "HDMI-A-1, 1920x1080, 1920x0, 1"
      ];

      workspace = [
        "1, monitor:DP-1"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:HDMI-A-1"
        "7, monitor:HDMI-A-1"
        "8, monitor:HDMI-A-1"
        "9, monitor:HDMI-A-1"
        "10, monitor:HDMI-A-1"
      ];
    };
  };
}
