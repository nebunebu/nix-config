{ config, ... }:
let
  c = config.colorScheme.palette;
in
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
          font-family: "HeavyData Nerd Font Propo", "Font Awesome 6 Free",  "Source Code Pro";
          font-size: 15px;
        }

        tooltip * {
          font-family: "ProFont Nerd Font", "Font Awesome 6 Free", "Source Code Pro";
        }

        tooltip {
          color: #${c.base04};
          background-color: #${c.base00};
          border-radius: 5px;
          border: 2px solid #${c.base09};
        }

        menu * {
          font-family: "ProFont Nerd Font", "Font Awesome 6 Free", "Source Code Pro";
        }

        menu {
          color: #${c.base04};
          background-color: #${c.base00};
          border-radius: 5px;
          border: 2px solid #${c.base09};
        }

        window#waybar {
           background-color: rgba(0, 0, 0, 0.0);
           color: #${c.base00};
        }

        button {
            box-shadow: inset 0 -3px transparent;
            border: none;
            border-radius: 5px;
        }

        button:hover {
            background: #${c.base0C};
            box-shadow: inset 0 -3px #${c.base0C};
        }

        #workspaces button {
            padding: 0px 5px;
            background-color: #${c.base0B};
            color: #${c.base00};
            margin: 0 1px;
        }

        #workspaces button:hover {
        		box-shadow: inherit;
        		text-shadow: inherit;
            background-color: #${c.base0C};
            color: #${c.base00};
        }

        #workspaces button.urgent {
            background-color: #${c.base09};
        }

        #workspaces button.focused,
        #workspaces button.active
        {
            background-color: #${c.base0D};
            color: #${c.base00};
        }

        #custom-notification,
        #custom-waybarmpris,
        #custom-mic,
        #pulseaudio,
        #battery,
        #tray,
        #clock {
            padding: 0 10px;
            color: #${c.base00};
            background: #${c.base0A};
            border-radius: 5px;
            margin: 0 1px;
        }


        #custom-waybarmpris {
          font-family: "DroidSansMono Nerd Font", "Font Awesome 6 Free", "Source Code Pro";
          background: #${c.base0C};
        }

        #custom-waybarmpris.paused {
          background: #${c.base04};
        }

        #tray {
          background: #${c.base04};
        }


        #pulseaudio.source-muted {
            background-color: #${c.base08};
        }

        #pulseaudio.muted {
            background-color: #${c.base08};
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
