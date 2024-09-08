{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.desktop.firefox;
  ffao = [
    inputs.firefox-addons.packages."${pkgs.system}".ublock-origin
    inputs.firefox-addons.packages."${pkgs.system}".vimium
  ];
in
{
  options.desktop.firefox = {
    enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
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
            ]
            ++ ffao;
          userChrome = # css
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
