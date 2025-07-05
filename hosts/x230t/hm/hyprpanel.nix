{ pkgs, ... }:
{
  home.packages = [
    pkgs.bluez
    pkgs.bluez-tools
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprpanel"
  ];

  programs.hyprpanel = {
    enable = true;
    # dontAssertNotificationDaemons = false;
    systemd.enable = true;

    settings = {
      "theme.bar.buttons.dashboard.icon" = "#30738f";
      "theme.bar.buttons.workspaces.active" = "#f6c177";
      "theme.bar.buttons.workspaces.available" = "#6e6a86";
      "theme.bar.buttons.workspaces.hover" = "#908caa";
      "theme.bar.buttons.workspaces.numbered_active_underline_color" = "#f6c177";
      "theme.bar.buttons.workspaces.occupied" = "#c4a7e7";
      "theme.bar.buttons.y_margins" = "0.2rem";
      "theme.bar.outer_spacing" = "0.2rem";
      layout = {
        "bar.layouts" = {
          "0" = {
            left = [
              "dashboard"
              "workspaces"
            ];
            middle = [
              "media"
              "clock"
            ];
            right = [
              "battery"
              "volume"
              "notifications"
              "systray"
            ];
          };
        };
      };
      bar = {
        launcher.autoDetectIcon = true;
        workspaces = {
          showWsIcons = true;
          workspaces = 9;
          ignored = "-";
        };
        clock.format = "%a %b %d  %-I:%M:%S %p";
      };

      theme = {
        font = {
          name = "IBM Plex Sans Thai Looped";
          size = "0.9rem";
        };
        bar = {
          layer = "bottom";
          transparent = true;
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
          controls.enabled = false;
          directories.enabled = false;
          shortcuts = {
            # enabled = false;
            left = {
              shortcut1 = {
                command = "firefox";
                icon = "";
                tooltip = "Firefox";
              };
            };
          };
        };
      };

      notifications.active_monitor = false;

      wallpaper = {
        enable = false;
        pywal = false;
      };
    };
  };
}
