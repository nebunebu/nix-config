{
  lib,
  config,
  ...
}:
let
  cfg = config.hm.communications.discord;
in
{
  options.hm.communications.discord = {
    enable = lib.mkEnableOption "enable discord";
  };

  config = lib.mkIf cfg.enable {
    programs.discord = {
      enable = true;
    };

    # xdg.configFile."discord/settings.json".text = builtins.toJSON {
    #   BACKGROUND_COLOR = "#121214";
    #   chromiumSwitches = { };
    #   # SKIP_HOST_UPDATE = true;
    #   IS_MAXIMIZED = true;
    #   IS_MINIMIZED = false;
    #   openasar = {
    #     setup = true;
    #     quickstart = true;
    #     dev = true;
    #     css = # css
    #       ''
    #         /**
    #          * @name midnight (rosé pine)
    #          * @description a dark, customizable discord theme. based on rosé pine theme (https://rosepinetheme.com).
    #          * @author refact0r
    #          * @version 2.0.1
    #          * @invite nz87hXyvcy
    #          * @website https://github.com/refact0r/midnight-discord
    #          * @source https://github.com/refact0r/midnight-discord/blob/master/themes/flavors/midnight-rose-pine.theme.css
    #          * @authorId 508863359777505290
    #          * @authorLink https://www.refact0r.dev
    #          */
    #         @import url('https://refact0r.github.io/midnight-discord/build/midnight.css');
    #         body {
    #           --font: 'figtree';
    #           --gap: 12px;
    #           --divider-thickness: 4px;
    #           --animations: on;
    #           --list-item-transition: 0.2s ease;
    #           --dms-icon-svg-transition: 0.4s ease;
    #           --move-top-bar-buttons: off;
    #           --custom-app-top-bar-height: 32px;
    #           --custom-window-controls: on;
    #           --window-control-size: 14px;
    #           --dms-icon: off;
    #           --dms-icon-svg-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg');
    #           --dms-icon-svg-size: 90%;
    #           --dms-icon-color-before: var(--icon-secondary);
    #           --dms-icon-color-after: var(--white);
    #           --dms-background: image;
    #           --dms-background-image-url: url('https://raw.githubusercontent.com/rose-pine/rose-pine-theme/main/assets/icon.png');
    #           --dms-background-image-size: cover;
    #           --dms-background-color: linear-gradient(70deg, var(--blue-2), var(--purple-2), var(--red-2));
    #           --background-image: off;
    #           --background-image-url: none;
    #           --transparency-tweaks: off;
    #           --remove-bg-layer: off;
    #           --panel-blur: off;
    #           --blur-amount: 12px;
    #           --bg-floating: var(--bg-3);
    #           --flipped-chatbar: on;
    #           --chatbar-height: 47px;
    #           --chatbar-padding: 8px;
    #           --small-user-panel: off;
    #         }
    #         :root {
    #           --colors: on;
    #           --text-0: var(--bg-3);
    #           --text-1: hsl(245, 50%, 95%);
    #           --text-2: #e0def4;
    #           --text-3: hsl(245, 40%, 80%);
    #           --text-4: #908caa;
    #           --text-5: #6e6a86;
    #           --bg-1: #45475a;
    #           --bg-2: #26233a;
    #           --bg-3: #1f1d2e;
    #           --bg-4: #191724;
    #           --hover: hsla(245, 22%, 40%, 0.1);
    #           --active: hsla(245, 22%, 40%, 0.2);
    #           --active-2: hsla(245, 22%, 40%, 0.3);
    #           --message-hover: hsla(245, 0%, 0%, 0.1);
    #           --accent-1: hsl(2, 65%, 88%);
    #           --accent-2: #ebbcba;
    #           --accent-3: #ebbcba;
    #           --accent-4: hsl(2, 55%, 78%);
    #           --accent-5: hsl(2, 55%, 73%);
    #           --accent-new: var(--red-2);
    #           --mention: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 90%) 40%, transparent);
    #           --mention-hover: linear-gradient(to right, color-mix(in hsl, var(--accent-2), transparent 95%) 40%, transparent);
    #           --reply: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent);
    #           --reply-hover: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent);
    #           --online: var(--green-2);
    #           --dnd: var(--red-2);
    #           --idle: var(--yellow-2);
    #           --streaming: var(--purple-2);
    #           --offline: var(--text-4);
    #           --border-light: var(--hover);
    #           --border: var(--active);
    #           --button-border: hsl(245, 0%, 100%, 0.1);
    #           --red-1: hsl(343, 76%, 73%);
    #           --red-2: #eb6f92;
    #           --red-3: #eb6f92;
    #           --red-4: hsl(343, 76%, 63%);
    #           --red-5: hsl(343, 76%, 58%);
    #           --green-1: hsl(197, 49%, 43%);
    #           --green-2: #31748f;
    #           --green-3: #31748f;
    #           --green-4: hsl(197, 49%, 34%);
    #           --green-5: hsl(197, 49%, 30%);
    #           --blue-1: hsl(189, 48%, 78%);
    #           --blue-2: #9ccfd8;
    #           --blue-3: #9ccfd8;
    #           --blue-4: hsl(189, 43%, 68%);
    #           --blue-5: hsl(189, 43%, 63%);
    #           --yellow-1: hsl(35, 88%, 77%);
    #           --yellow-2: #f6c177;
    #           --yellow-3: #f6c177;
    #           --yellow-4: hsl(35, 88%, 67%);
    #           --yellow-5: hsl(35, 88%, 62%);
    #           --purple-1: hsl(267, 57%, 83%);
    #           --purple-2: #c4a7e7;
    #           --purple-3: #c4a7e7;
    #           --purple-4: hsl(267, 57%, 73%);
    #           --purple-5: hsl(267, 57%, 68%);
    #         }
    #       '';
    #   };
    #   trayBalloonShown = true;
    # };
  };
}
