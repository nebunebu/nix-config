{
  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprpanel"
  ];
  # home.packages = [ pkgs.bluez pkgs.bluez-tools ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    theme = "rose_pine";

    override = {
      "theme.bar.buttons.dashboard.icon" = "#30738f";
      "theme.bar.buttons.workspaces.active" = "#f6c177";
      "theme.bar.buttons.workspaces.available" = "#6e6a86";
      "theme.bar.buttons.workspaces.hover" = "#908caa";
      "theme.bar.buttons.workspaces.numbered_active_underline_color" = "#f6c177";
      "theme.bar.buttons.workspaces.occupied" = "#c4a7e7";
    };

    settings = {
      bar = {
        launcher.autoDetectIcon = true;
        workspaces.showWsIcons = true;
        clock.format = "%a %b %d  %-I:%M:%S %p";
      };
      theme = {
        font = {
          name = "IBM Plex Sans Thai Looped";
        };
        bar = {
          layer = "bottom";
          transparent = true;
          # outer_spacing = "0.2rem";
          # y_margins = "0.2rem";
        };
      };
      menus = {
        clock = {
          time = {
            military = false;
            hideSeconds = true;
          };
          weather.unit = "imperial";
        };
        dashboard = {
          # directories = {
          #   left = {
          #     directory1 = {
          #       command = "bash -c \"ghostty -e yazi $HOME/Media/\"";
          #       label = "Media";
          #     };
          #   };
          # };
        };
      };
      wallpaper = {
        enable = false;
        pywal = false;
      };
    };
  };
}
