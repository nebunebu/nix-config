{ lib, config, ... }:
/* background-color: #${config.stylix.base16Scheme.palette.base0C}; */
let
  palette = config.stylix.base16Scheme.palette;
  transparent = "rgba(0, 0, 0, 0.0)";
in
{
  programs.waybar = lib.mkForce {
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
           background-color: ${transparent};
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
          background-color: #${palette.base0B};
          color: #${palette.base02};
        }

        #workspaces button:hover {
          background-color: #${palette.base0C};
        	box-shadow: inherit;
        	text-shadow: inherit;
        }

        #workspaces button.urgent {
          background-color: #${palette.base08};
        }

        #workspaces button.focused,
        #workspaces button.active
        {
          background-color: #${palette.base0D};
          color: #${palette.base02};
        }

        #custom-notification,
        #custom-waybarmpris,
        #custom-mic,
        #submap,
        #pulseaudio,
        #battery,
        #tray,
        #clock {
          background-color: #${palette.base05};
          color: #${palette.base02};
          padding: 0 10px;
          border-radius: 5px;
          margin: 0 1px;
        }


        #battery.warning {
          background-color: #${palette.base08};
          color: #${palette.base02};
        }

        #battery.charging {
          background-color: #${palette.base0D};
          color: #${palette.base02};
        }

        #custom-waybarmpris {
          /* font-family: "DroidSansMono Nerd Font", "Font Awesome 6 Free", "Source Code Pro"; */
        }

        #custom-waybarmpris.paused {
        }

        #tray {
          background-color: #${palette.base03};
        }


        #pulseaudio.source-muted {
          background-color: #${palette.base08};
        }

        #pulseaudio.muted {
          background-color: #${palette.base08};
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
