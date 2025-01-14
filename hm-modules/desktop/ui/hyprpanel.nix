{ inputs
, pkgs
, config
, lib
, ...
}:
let
  cfg = config.neb.desktop.ui.hyprpanel;
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  options = {
    neb.desktop.ui.hyprpanel = {
      x230t.enable = lib.mkEnableOption "enable x230t hyprpanel setup";
      t5610.enable = lib.mkEnableOption "enable t5610 hyprpanel setup";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.t5610.enable {
      wayland.windowManager.hyprland.settings.exec-once = [
        "hyprpanel"
      ];
      home.packages = [ pkgs.bluez pkgs.bluez-tools ];

      programs.hyprpanel = {
        enable = true;
        hyprland.enable = true;
        overwrite.enable = true;
        theme = "rose_pine";
        override = {
          # theme.bar.menus.text = "#777333";
        };

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


      # menus.dashboard.directories.enabled = false;
      # menus.dashboard.stats.enable_gpu = true;

      # theme = {
      #   matugen = false;
      #   font = {
      #     name = "IBM Plex Mono";
      #     size = "16px";
      #     weight = 800;
      #   };
      #   bar = {
      #     transparent = true;
      #   };
      # };


      #   theme.font = {
      #     name = "
      #         Blex
      #         Mono ";
      #     size = " 16
      #         px ";
      #   };

      # wallpaper.enable = false;
    })


    (lib.mkIf cfg.x230t.enable {
      programs.hyprpanel = { };
    })
  ];
}




