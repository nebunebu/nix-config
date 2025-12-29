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

  imports = [ ./userchrome.nix ];

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
  };
}
