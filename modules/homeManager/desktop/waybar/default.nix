{ pkgs, config, lib, ... }:
let
  cfg = config.app.waybar;
  wbm = builtins.import ./modules.nix;
in
{
  imports = [
    ./style.nix
    ./swaync
  ];

  options = {
    app.waybar = {
      device = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "x230t" "t5610" ]);
        default = null;
        description = "Select the device configuration for waybar";
      };
      x230t.enable = lib.mkEnableOption "enable x230t waybar setup";
      t5610.enable = lib.mkEnableOption "enable t5610 waybar setup";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.x230t.enable {

      home.packages = [
        pkgs.waybar
        pkgs.waybar-mpris
        pkgs.libnotify
      ];

      wayland.windowManager.hyprland.settings.exec-once = [
        "${pkgs.waybar}/bin/waybar &"
      ];

      programs.waybar = {
        enable = true;
        settings = {
          firstBar = {
            layer = "top";
            position = "top";
            height = 30;
            output = [ "LVDS-1" ];
            modules-left = [ "hyprland/workspaces" ];
            modules-center = [
              "custom/waybarmpris"
              "hyprland/submap"
            ];
            modules-right = [
              "pulseaudio"
              # "custom/mic"
              "battery"
              "clock"
              "tray"
              "custom/notification"
            ];
          } // wbm;
        };
      };
    })

    (lib.mkIf cfg.t5610.enable {
      home.packages = [
        pkgs.waybar
        pkgs.waybar-mpris
        pkgs.libnotify
      ];

      wayland.windowManager.hyprland.settings.exec-once = [
        "${pkgs.waybar}/bin/waybar &"
      ];

      programs.waybar = {
        enable = true;
        settings = {
          firstBar = {
            layer = "top";
            position = "top";
            height = 30;
            output = [
              "DP-1"
            ];
            modules-left = [ "hyprland/workspaces" ];
            modules-center = [
              "custom/waybarmpris"
              "hyprland/submap"
            ];
            modules-right = [
              "custom/notification"
            ];
          } // wbm;

          secondBar = {
            layer = "top";

            position = "top";
            height = 30;
            output = [ "DP-2" ];
            modules-left = [ "hyprland/workspaces" ];
            modules-center = [ "hyprland/submap" ];
            modules-right = [ "pulseaudio" "clock" "tray" ];
          } // wbm;
        };
      };
    })
  ];
}
