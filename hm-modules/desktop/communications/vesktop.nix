{
  lib,
  config,
  pkgs,
  ...
}:
# TODO: override systray icon
# TODO: put style in seperate file
let
  cfg = config.neb.desktop.communications.vesktop;
in
{
  options.neb.desktop.communications.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      # CREDIT: https://github.com/raidenovich/OuterHeaven/blob/850546a45382efd76a1776a988e278dc4c7fac3b/modules/home-manager/gui/vesktop.nix#L4
      (pkgs.vesktop.overrideAttrs {
        # withSystemVencord = true;
        desktopItems = [
          (pkgs.makeDesktopItem {
            name = "vesktop";
            desktopName = "Vesktop";
            exec = "vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
            icon = "vesktop";
            startupWMClass = "VencordDesktop";
            genericName = "Internet Messenger";
            keywords = [
              "discord"
              "vencord"
              "electron"
              "chat"
            ];
            categories = [
              "Network"
              "InstantMessaging"
              "Chat"
            ];
          })
        ];
      })
    ];

    xdg.configFile."vesktop/themes/rose-pine.theme.css".text = # css
      ''
        /**
         * @name system24 (rose-pine)
         * @description A tui-style discord theme.
         * @author refact0r
         * @version 1.0.0
         * @invite nz87hXyvcy
         * @website https://github.com/refact0r/system24
         * @source https://github.com/refact0r/system24/blob/master/system24.theme.css
         * @authorId 508863359777505290
         * @authorLink https://www.refact0r.dev
        */

        /* import theme modules */
        @import url('https://refact0r.github.io/system24/src/main.css'); /* main theme css. DO NOT REMOVE */
        @import url('https://refact0r.github.io/system24/src/unrounding.css'); /* gets rid of all rounded corners. remove if you want rounded corners. */

        /* customize things here */
        :root {
          --font: 'Borg Sans Mono'; /* UI font name. it must be installed on your system. */
          letter-spacing: -0.05ch; /* decreases letter spacing for better readability. */
          font-weight: 300; /* UI font weight. */
          --label-font-weight: 500; /* font weight for panel labels. */
          --corner-text: 'system24'; /* custom text to display in the corner. only works on windows. */
          --pad: 16px; /* padding between panels. */
          --txt-pad: 10px; /* padding inside panels to prevent labels from clipping */
          --panel-roundness: 0px; /* corner roundness of panels. ONLY WORKS IF unrounding.css IS REMOVED (see above). */

          /* background colors */
          --bg-0: var(--base); /* main background color. */
          --bg-1: var(--surface); /* background color for secondary elements like code blocks, embeds, etc. */
          --bg-2: var(--surface); /* color of neutral buttons. */
          --bg-3: var(--overlay); /* color of neutral buttons when hovered. */

          /* state modifiers */
          --hover: var(--overlay); /* color of hovered elements. */
          --active: var(--overlay); /* color of elements when clicked. */
          --selected: var(--active); /* color of selected elements. */

          /* text colors */
          --txt-dark: var(--hl_low); /* color of dark text on colored backgrounds. */
          --txt-link: var(--foam); /* color of links. */
          --txt-0: var(--text); /* color of bright/white text. */
          --txt-1: var(--text); /* main text color. */
          --txt-2: var(--subtle); /* color of secondary text like channel list. */
          --txt-3: var(--muted); /* color of muted text. */

          /* accent colors */
          --acc-0: var(--iris); /* main accent color. */
          --acc-1: var(--foam); /* color of accent buttons when hovered. */
          --acc-2: var(--pine); /* color of accent buttons when clicked. */

          /* borders */
          --border-width: 2px; /* panel border thickness. */
          --border-color: var(--overlay); /* panel border color. */
          --border-hover-color: var(--acc-0); /* panel border color when hovered. */
          --border-transition: 0.2s ease; /* panel border transition. */

          /* status dot colors */
          --online-dot: var(--pine); /* color of online dot. */
          --dnd-dot: var(--love); /* color of do not disturb dot. */
          --idle-dot: var(--gold); /* color of idle dot. */
          --streaming-dot: var(--iris); /* color of streaming dot. */

          /* mention/ping and message colors */
          --mention-txt: var(--rose); /* color of mention text. */
          --mention-bg: var(--hl_low); /* background highlight of mention text. */
          --mention-overlay: var(--hl_low); /* overlay color of messages that mention you. */
          --mention-hover-overlay: var(--overlay); /* overlay color of messages that mention you when hovered. */
          --reply-overlay: var(--active); /* overlay color of message you are replying to. */
          --reply-hover-overlay: var(--hover); /* overlay color of message you are replying to when hovered. */

          /* color shades */
          --base: #191724;
          --surface: #1f1d2e;
          --overlay: #26233a;
          --muted: #6e6a86;
          --subtle: #908caa;
          --text: #e0def4;
          --love: #eb6f92;
          --pink: var(--love);
          --gold: #f6c177;
          --rose: #ebbcba;
          --pine: #31748f;
          --green: var(--pine);
          --foam: #9ccfd8;
          --green-1: var(--foam);
          --iris: #c4a7e7;
          --hl_low: #21202e;
          --hl_med: #403d52;
          --hl_high: #524f67;
          /* defaults */
          --pink-1: oklch(63% 0.12 0);
          --pink-2: oklch(53% 0.12 0);
          --purple: oklch(73% 0.12 300);
          --purple-1: oklch(63% 0.12 300);
          --purple-2: oklch(53% 0.12 300);
          --cyan: oklch(73% 0.12 200);
          --yellow: oklch(78% 0.12 80);
          --green-2: oklch(53% 0.12 160);
        }
      '';
  };
}
