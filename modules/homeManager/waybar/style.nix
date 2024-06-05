{ config, ... }:
{
  programs.waybar = {
    style =
      /*
      css
      */
      ''
        * {
          border: none;
          border-radius: 5px;
          /* font-family: "HeavyData Nerd Font Propo", "Font Awesome 6 Free",  "Source Code Pro"; */
          font-size: 15px;
        }

        tooltip * {
          /* font-family: "ProFont Nerd Font", "Font Awesome 6 Free", "Source Code Pro"; */
        }

        tooltip {
          border-radius: 5px;
        }

        menu * {
          font-family: "ProFont Nerd Font", "Font Awesome 6 Free", "Source Code Pro";
        }

        menu {
          border-radius: 5px;
        }

        window#waybar {
           background-color: rgba(0, 0, 0, 0.0);
        }

        button {
            box-shadow: inset 0 -3px transparent;
            border: none;
            border-radius: 5px;
        }

        button:hover {
        }

        #workspaces button {
            padding: 0px 5px;
            margin: 0 1px;
        }

        #workspaces button:hover {
        		box-shadow: inherit;
        		text-shadow: inherit;
        }

        #workspaces button.urgent {
        }

        #workspaces button.focused,
        #workspaces button.active
        {
        }

        #custom-notification,
        #custom-waybarmpris,
        #custom-mic,
        #submap,
        #pulseaudio,
        #battery,
        #tray,
        #clock {
            padding: 0 10px;
            border-radius: 5px;
            margin: 0 1px;
        }


        #battery.warning {
        }

        #battery.charging {
        }

        #custom-waybarmpris {
          /* font-family: "DroidSansMono Nerd Font", "Font Awesome 6 Free", "Source Code Pro"; */
        }

        #custom-waybarmpris.paused {
        }

        #tray {
        }


        #pulseaudio.source-muted {
        }

        #pulseaudio.muted {
        }

        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }
      '';
  };
}
