{
  programs.hyprpanel = {
    # override = {
    # };

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" ];
          middle = [ "media" ];
          right = [ "notifications" ];
        };
        "1" = {
          left = [ "workspaces" ];
          middle = [ "clock" ];
          right = [ "volume" "systray" ];
        };
      };
    };

    settings = {
      theme = {
        font = {
          size = "1rem";
        };
      };
      menus = {
        dashboard = {
          shortcuts = {
            left = {
              shortcut1 = {
                command = "firefox";
                icon = "";
                tooltip = "Firefox";
              };
              shortcut2 = {
                command = "firefox";
                icon = "";
                tooltip = "Firefox";
              };
              shortcut3 = {
                command = "firefox";
                icon = "";
                tooltip = "Firefox";
              };
              shortcut4 = {
                command = "firefox";
                icon = "";
                tooltip = "Firefox";
              };
            };
            right = {
              shortcut1 = {
                command = "firefox";
                icon = "";
                tooltip = "Firefox";
              };
              shortcut3 = {
                command = "firefox";
                icon = "";
                tooltip = "Firefox";
              };
            };
          };
          directories = {
            left = {
              directory1 = {
                command = "bash -c \"xdg-open $HOME/Downloads/\"";
                label = "󰉍 Downloads";
              };
              directory2 = {
                command = "bash -c \"xdg-open $HOME/Downloads/\"";
                label = "󰉍 Downloads";
              };
              directory3 = {
                command = "bash -c \"xdg-open $HOME/Downloads/\"";
                label = "󰉍 Downloads";
              };
            };
            right = {
              directory1 = {
                command = "bash -c \"xdg-open $HOME/Downloads/\"";
                label = "󰉍 Downloads";
              };
              directory2 = {
                command = "bash -c \"xdg-open $HOME/Downloads/\"";
                label = "󰉍 Downloads";
              };
              directory3 = {
                command = "bash -c \"xdg-open $HOME/Downloads/\"";
                label = "󰉍 Downloads";
              };
            };
          };
        };
      };
    };
  };
}
