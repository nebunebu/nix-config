{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.hm.web-browsers.firefox;
in
{
  options.hm.web-browsers.firefox = {
    enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf cfg.enable {
    stylix.targets.firefox.profileNames = [ "nebu" ];

    programs.firefox = {
      enable = true;
      nativeMessagingHosts = [
        pkgs.tridactyl-native
      ];

      profiles = {
        nebu = {
          isDefault = true;
          id = 0;

          extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
            i-dont-care-about-cookies
            new-tab-override
            # old-reddit-redirect
            # reddit-enhancement-suite
            stylebot-web
            stylus
            tridactyl
            ublock-origin
            aw-watcher-web
            link-gopher
            linkding-extension
          ];

          settings = {
            # enable userChrome.css + userContent.css
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

            "ui.key.menuAccessKeyFocuses" = false;
            "browser.startup.homepage" = "https://glance.nebunebu.xyz";
            "browser.startup.page" = 1;
          };
        };
      };
    };

    # Write userChrome.css into the nebu profile (no theme add-on).
    home.file.".mozilla/firefox/nebu/chrome/userChrome.css".text = ''
      /* Rosé Pine (best-effort) UI theming via userChrome.css */

      :root {
        --rp-toolbar: rgb(31, 29, 46);
        --rp-toolbar-text: rgb(224, 222, 244);
        --rp-frame: rgb(25, 23, 36);
        --rp-tab-text: rgb(144, 140, 170);
        --rp-field: rgb(38, 35, 58);
        --rp-icons: rgb(235, 188, 186);
        --rp-attention: rgb(235, 111, 146);

        /* Firefox UI vars (many are LWT/lightweight-theme vars; we force them) */
        --toolbar-bgcolor: var(--rp-toolbar) !important;
        --toolbar-color: var(--rp-toolbar-text) !important;

        --lwt-accent-color: var(--rp-frame) !important;
        --lwt-text-color: var(--rp-toolbar-text) !important;
        --lwt-toolbar-field-background-color: var(--rp-field) !important;
        --lwt-toolbar-field-color: var(--rp-toolbar-text) !important;

        --tab-selected-bgcolor: var(--rp-toolbar) !important;
        --tab-selected-textcolor: var(--rp-toolbar-text) !important;

        --toolbarbutton-icon-fill: var(--rp-icons) !important;
        --toolbarbutton-icon-fill-attention: var(--rp-attention) !important;
      }

      /* Top chrome (tabs + toolbars) */
      #navigator-toolbox {
        background-color: var(--rp-frame) !important;
        color: var(--rp-toolbar-text) !important;
      }

      /* Toolbar strip */
      #nav-bar, #PersonalToolbar {
        background-color: var(--rp-toolbar) !important;
        color: var(--rp-toolbar-text) !important;
      }

      /* Tabs */
      .tabbrowser-tab {
        color: var(--rp-tab-text) !important;
      }

      .tabbrowser-tab[selected],
      .tabbrowser-tab[multiselected] {
        color: var(--rp-toolbar-text) !important;
      }

      #TabsToolbar .tab-background[selected],
      #TabsToolbar .tab-background[multiselected] {
        background-color: var(--rp-toolbar) !important;
      }

      /* URL bar + search */
      #urlbar,
      #searchbar,
      #urlbar-background,
      .searchbar-textbox {
        background-color: var(--rp-field) !important;
        color: var(--rp-toolbar-text) !important;
      }

      #urlbar-input,
      .searchbar-textbox {
        color: var(--rp-toolbar-text) !important;
      }

      /* Popups / panels (best-effort) */
      panelview,
      panel,
      menupopup,
      popup {
        --panel-background: var(--rp-toolbar) !important;
        --panel-color: var(--rp-toolbar-text) !important;
      }

      /* Remove bright borders around fields */
      #urlbar-background,
      #searchbar,
      .searchbar-textbox {
        border-color: transparent !important;
        box-shadow: none !important;
      }
    '';

    # Optional: style internal pages (about:newtab, about:preferences, etc.)
    home.file.".mozilla/firefox/nebu/chrome/userContent.css".text = ''
      /* Rosé Pine-ish internal pages (minimal) */
      :root {
        --rp-bg: rgb(25, 23, 36);
        --rp-fg: rgb(224, 222, 244);
        --rp-panel: rgb(31, 29, 46);
      }

      @-moz-document url-prefix("about:") {
        html, body {
          background: var(--rp-bg) !important;
          color: var(--rp-fg) !important;
        }
      }
    '';
  };
}
