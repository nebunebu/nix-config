{ pkgs, lib, config, ... }:

let
  modules = builtins.import ../modules.nix;
  cfg = config.app.waybar;
in
{
  imports = [
    ../style.nix
    ../swaync
  ];

  options = {
    app.waybar.t5610.enable = lib.mkEnableOption "enable waybar settings for t5610";
  };

  config = lib.mkIf config.app.waybar.t5610.enable {

    home.packages = [
      pkgs.waybar
      pkgs.waybar-mpris
    ];

    wayland.windowManager.hyprland.settings.exec-once = lib.mkIf cfg.hyprlandIntegration.enable [
      "${pkgs.waybar}/bin/waybar &"
    ];

    programs.waybar = {
      enable = true;
      settings = {
        firstBar =
          {
            layer = "top";
            position = "top";
            height = 30;
            output = [
              "DP-1"
            ];
            modules-left = [ "hyprland/workspaces" ];
            modules-center = [
              "custom/waybarmpris"
            ];
            modules-right = [
              "custom/notification"
            ];
          } // modules;

        secondBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [ "DP-2" ];
          modules-left = [ "hyprland/workspaces" ];
          modules-right = [ "pulseaudio" "clock" "tray" ];
        } // modules;
      };
    };
  };
}
