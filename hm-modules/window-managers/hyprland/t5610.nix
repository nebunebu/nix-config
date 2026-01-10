{ lib, config, ... }:
let
  cfg = config.hm.window-managers.hyprland.t5610;
  primaryMonitor = "DP-1";
  secondaryMonitor = "DP-2";
in
{
  options = {
    hm.window-managers.hyprland.t5610.enable = lib.mkEnableOption "enable hyprland settings for t5610";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      monitor = [
        "${primaryMonitor}, 1920x1080, 0x0, 1"
        "${secondaryMonitor}, 1920x1080, 1920x0, 1"
        "${secondaryMonitor}, addreserved, 0, 0, 50, 0"
      ];

      workspace = [
        "1, monitor:${primaryMonitor}, persistent:true"
        "2, monitor:${primaryMonitor}, persistent:true"
        "3, monitor:${primaryMonitor}, persistent:true"
        "4, monitor:${primaryMonitor}, persistent:true"
        "5, monitor:${primaryMonitor}, persistent:true"
        "6, monitor:${secondaryMonitor}, persistent:true"
        "7, monitor:${secondaryMonitor}, persistent:true"
        "8, monitor:${secondaryMonitor}, persistent:true"
        "9, monitor:${secondaryMonitor}, persistent:true"
      ];
    };
  };
}
