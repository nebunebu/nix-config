{ pkgs, lib, config, ... }:

{
  imports = [
    ../swaync
    ../style.nix
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
          output = [ "LVDS-1" ];
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [  "custom/waybarmpris" ];
          modules-right = [
            "pulseaudio"
            "custom/mic"
            "battery"
            "clock"
            "tray"
            "custom/notification"
          ];

          "battery" = {
            "bat" = "BAT0";
            "interval" = 1;
            "states" = {
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{capacity} {icon}";
            "format-charging" = "{capacity}<span font='Font Awesome 5 Free'></span>";
            "format-icons" = [ "" "" "" "" "" ];
            "max-length" = 25;
          };

          "custom/waybarmpris" = {
            "return-type" = "json";
            "exec" = "waybar-mpris --position --autofocus";
            "on-click" = "waybar-mpris --send toggle";
            "on-click-right" = "waybar-mpris --send player-next";
            "on-scroll-up" = "waybar-mpris --send next";
            "on-scroll-down" = "waybar-mpris --send prev";
            "escape" = true;
          };

          "custom/notification" = {
            "tooltip" = false;
            "format" = "{icon}";
            "format-icons" = {
              "notification" = "";
              "none" = "";
              "dnd-notification" = "";
              "dnd-none" = "";
              "inhibited-notification" = "";
              "inhibited-none" = "";
              "dnd-inhibited-notification" = "";
              "dnd-inhibited-none" = "";
            };

            "return-type" = "json";
            "exec-if" = "which swaync-client";
            "exec" = "swaync-client -swb";
            "on-click" = "sleep 0.1 && swaync-client -op";
            "on-click-right" = "sleep 0.1 && swaync-client -d -sw";
            "escape" = true;
          };
        };

        "pulseaudio" = {
          "format" = "{volume}% {icon} {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = " {volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "pavucontrol";
        };

        # Assuming the icon names are "mic-on" and "mic-off"
        "custom/mic" = {
          format = "{icon}";
          return-type = "text";
          exec = ''
            if grep -q '[MUTED]' <(wpctl get-volume @DEFAULT_AUDIO_SOURCE@); then
              echo "mic-off";
            else
              echo "default";
            fi
          '';
          interval = 1;
          format-icons = {
            "mic-off" = ""; # Path to mic-off icon
            "default" = ""; # Path to mic-on icon
          };
        };

        "clock" = {
          "format" = "{:%I:%M}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };
      };
    };
  };
}
