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

    programs.hyprpanel = {
      layout = {
        "bar.layouts" = {
          "0" = {
            left = [ "dashboard" "workspaces" ];
            middle = [ "clock" ];
            right = [ "battery" "volume" "notifications" "systray" ];
          };
        };
      };
    };

    override = {
      bar.workspaces.showWsIcons = true;
      theme.bar.buttons.y_margins = "0.2rem";
      theme.bar.outer_spacing = "0.2rem";
      theme.bar.transparent = true;
      theme.bar.layer = "bottom";
      # theme.font.size = "1rem";
      wallpaper.enable = false;
    };

    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces = { };
      menus = {
        clock = {
          time = {
            military = false;
            hideSeconds = true;
          };
          weather.unit = "imperial";
        };
        dashboard = {
          directories = {
            left = {
              directory1 = {
                command = "bash -c \"ghostty -e yazi $HOME/Media/\"";
                label = "Media";
              };
            };
          };
          powermenu = {
            avatar = {
              image = "$HOME/Media/Images/yak_shaving_magpie.png";
              name = "nebu";
              # confirmation = true;
            };
          };
        };
      };
    };
  };
}
