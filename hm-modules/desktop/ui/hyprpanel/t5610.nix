{
  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    theme = "rose_pine";
    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" ];
          middle = [ "media" ];
          right = [ "notifications" ];
        };
        "1" = {
          left = [ "workspaces" ];
          middle = [ ];
          right = [ "clock" "volume" "systray" ];
        };
      };
    };

    settings = {
      bar.launcher.autoDetectIcon = true;
      bar = {
        workspaces = { };
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
