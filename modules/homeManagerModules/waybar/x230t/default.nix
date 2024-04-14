{ pkgs, lib, config, ... }:

{
  imports = [
    ../swaync
    ../style.nix
    ../waybar.nix
  ];


  options = {
    app.waybar.x230t.enable = lib.mkEnableOption "enable waybar settings for x230t";
  };

  config = lib.mkIf config.app.waybar.x230t.enable {
    home.packages = with pkgs; [
      waybar-mpris
      libnotify
    ];

    programs.waybar = {
      enable = true;
      settings = {
        firstBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [
            "LVDS-1"
          ];
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [
            "custom/waybarmpris"
          ];
          modules-right = [
            "pulseaudio"
            "custom/mic"
            "battery"
            "clock"
            "tray"
            "custom/notification"
          ];

          import = ../waybar.nix;
        };
      };
    };
  };
}
