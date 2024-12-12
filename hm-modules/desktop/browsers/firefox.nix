{ lib
, config
, inputs
, pkgs
, ...
}:
let
  cfg = config.neb.desktop.browsers.firefox;
  ffao = [
    inputs.firefox-addons.packages."${pkgs.system}".ublock-origin
    inputs.firefox-addons.packages."${pkgs.system}".vimium
  ];
in
{
  options.neb.desktop.browsers.firefox = {
    enable = lib.mkEnableOption "enable firefox";
  };

  # TODO:  Extensions Add or Keep:
  # ActivityWatch Web Watcher
  # Get RSS Feed Url
  # I don't care about cookies
  # Old reddit redirect
  # Passff or alternative
  # Private Internet Access
  # Reddit Enhancement Suite
  # Stylebot
  # Stylus
  # Tridactyl
  # ublockorigin
  # bukubrowse
  # Maybe sideberry and terminal like styling
  # can probably remove multiple profiles
  # vimium

  config = lib.mkIf cfg.enable {

    programs.firefox = {
      enable = true;
      nativeMessagingHosts = [
        pkgs.tridactyl-native
      ];
      profiles = {
        nebu = {
          isDefault = true;
          id = 0;
          extensions =
            with inputs.firefox-addons.packages."x86_64-linux";
            [
              i-dont-care-about-cookies
              reddit-enhancement-suite
              old-reddit-redirect
              passff
              tridactyl
            ]
            ++ ffao;
          userChrome = lib.mkForce # css
            ''
              * {
                font-family: "DroidSansM Nerd Font" !important;
                font-family: "DroidSansM Nerd Font Mono" !important;
              };

            '';
          bookmarks = [
            {
              name = "claude";
              url = "https://claude.ai/chats";
            }
            {
              name = "wiki.nixos";
              url = "https://wiki.nixos.org";
            }
          ];
          settings = {
            "ui.key.menuAccessKeyFocuses" = false;
          };
        };
        noogle = {
          id = 1;
          userChrome = /* css  */ ''
            :root:not([customizing]) #navigator-toolbox:not(:hover):not(:focus-within) {
              max-height: 1px;
              min-height: calc(0px);
              overflow: hidden;
            }
            #TabsToolbar:not(:hover) #alltabs-button {display:none !important;}

            #navigator-toolbox::after {
              display: none !important;
            }

            #titlebar { appearance: none !important }

            #tabbrowser-tabs { 
              visibility: collapse !important;
            }
            #sidebar-header {
              visibility: collapse !important;
            }

            #main-window[sizemode="maximized"] #content-deck {
              padding-top: 8px;
            }
          '';

          settings = {
            "browser.startup.homepage" = "https://noogle.dev";
            "browser.startup.page" = 1;
            # "ui.window_class_override" = "FirefoxNoogle";
          };
          extensions = ffao;
        };
        nixpkgs = {
          id = 2;
          settings = {
            "browser.startup.homepage" = "https://search.nixos.org/packages";
            "browser.startup.page" = 1;
          };
          extensions = ffao;
        };
        hm-options = {
          id = 3;
          settings = {
            "browser.startup.homepage" = "https://mipmip.github.io/home-manager-option-search";
            "browser.startup.page" = 1;
          };
          extensions = ffao;
        };
        lichess = {
          id = 4;
          settings = {
            "browser.startup.homepage" = "https://lichess.org/training";
            "browser.startup.page" = 1;
          };
          extensions = ffao;
        };
        claude = {
          id = 5;
          settings = {
            "browser.startup.homepage" = "https://claude.ai/chats";
            "browser.startup.page" = 1;
          };
          extensions = ffao;
        };
      };
    };
  };
}
