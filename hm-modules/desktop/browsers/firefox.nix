{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.browsers.firefox;
in
{
  options.neb.desktop.browsers.firefox = {
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
            old-reddit-redirect
            reddit-enhancement-suite
            stylebot-web
            stylus
            tridactyl
            ublock-origin
            aw-watcher-web
            link-gopher
            # gopass-bridge
            # vide-downloadhelper
            # hoarder
            # keepa
            # obsidan?
            # greasemonkey
            # tampermonkey
            # violentmkey
            # wakatimes
            # passff
            # bukubrow
            # bulkurlopener
            # sponsorblock
            # sidebery
            # Get RSS Feed URL
            # Private Internet Access
            # firefox-color
            # shyfox
            # textfox
            # ff2mpv
          ];
          settings = {
            "ui.key.menuAccessKeyFocuses" = false;
            "browser.startup.homepage" = "https://glance.nebunebu.xyz";
            "browser.startup.page" = 1;
          };
        };
      };
    };
  };
}
