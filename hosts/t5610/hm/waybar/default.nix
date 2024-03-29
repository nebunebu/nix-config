{ pkgs, ... }: {
  imports = [
    ./style.nix
    # ../../../../home-manager/programs/swaync
  ];

  home = {
    packages = builtins.attrValues {
      inherit
        (pkgs)
        waybar-mpris
        ;
    };
  };

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
        modules-right = [
          "custom/waybarmpris"
          "custom/notification"
        ];

        "custom/waybarmpris" = {
          "return-type" = "json";
          "exec" = "waybar-mpris --position --autofocus";
          "on-click" = "waybar-mpris --send toggle";
          # This option will switch between players on right click.
          "on-click-right" = "waybar-mpris --send player-next";
          # // The options below will switch the selected player on scroll
          # "on-scroll-up" = "waybar-mpris --send player-next";
          # "on-scroll-down" = "waybar-mpris --send player-prev";
          # // The options below will go to next/previous track on scroll
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
      secondBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "DP-2"
        ];
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "clock" "tray" ];

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
