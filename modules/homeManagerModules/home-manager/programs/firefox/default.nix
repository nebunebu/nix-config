{ inputs, ... }:
let
  ffao = [
    inputs.firefox-addons.packages."x86_64-linux".ublock-origin
    inputs.firefox-addons.packages."x86_64-linux".vimium
  ];
in
{
  programs.firefox = {
    enable = true;
    profiles = {
      nebu = {
        isDefault = true;
        id = 0;
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          i-dont-care-about-cookies
          reddit-enhancement-suite
          old-reddit-redirect
        ] ++ ffao;
        userChrome = /* css */
          ''
            * {
              font-family: "DroidSansM Nerd Font" !important;
              font-family: "DroidSansM Nerd Font Mono" !important;
            };
          '';
      };
      noogle = {
        id = 1;
        settings = {
          "browser.startup.homepage" = "https://noogle.dev";
        };
        extensions = ffao;
      };
      nixpkgs = {
        id = 2;
        settings = {
          "browser.startup.homepage" = "https://search.nixos.org/packages";
        };
        extensions = ffao;
      };
      hm-options = {
        id = 3;
        settings = {
          "browser.startup.homepage" = "https://mipmip.github.io/home-manager-option-search";
        };
        extensions = ffao;
      };
      lichess = {
        id = 4;
        settings = {
          "browser.startup.homepage" = "https://lichess.org/training";
        };
        extensions = ffao;
      };
    };
  };
}
