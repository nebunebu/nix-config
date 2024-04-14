{ lib, config, pkgs, ... }:
let
  hypr-tab =
    (pkgs.writeShellScript "hypr-tab" ''
      if [ "$(hyprctl monitors -j | jq '.[].transform')" = "0" ]; then
        hyprctl keyword input:touchdevice:transform 1
        hyprctl keyword monitor LVDS-1, preferred, auto, 1, transform, 1
      else
        hyprctl keyword input:touchdevice:transform 0
        hyprctl keyword monitor LVDS-1, preferred, auto, 1, transform, 0
      fi
    '');
in
{

  options = {
    app.hyprland.x230t.enable = lib.mkEnableOption "enable hyprland settings for x230t";
  };

  config = lib.mkIf config.app.hyprland.x230t.enable {
    home.packages = [ pkgs.jq ];
    wayland.windowManager.hyprland = {
      settings = {
        monitor = [
          "LVDS-1, 1366x768, 0x0, 1"
        ];

        workspace = [
          "1, monitor:LVDS-1"
          "2, monitor:LVDS-1"
          "3, monitor:LVDS-1"
          "4, monitor:LVDS-1"
          "5, monitor:LVDS-1"
          "6, monitor:LVDS-1"
          "7, monitor:LVDS-1"
          "8, monitor:LVDS-1"
          "9, monitor:LVDS-1"
          "10, monitor:LVDS-1"
        ];

        bind = [
          ",XF86RotateWindows, exec, ${hypr-tab}"
          # ",XF86TaskPane, exec, ${hypr-tab}"
        ];
      };
    };
  };
}
