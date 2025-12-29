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
            stylebot-web
            stylus
            tridactyl
            ublock-origin
            aw-watcher-web
            link-gopher
            linkding-extension
          ];

          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "devtools.chrome.enabled" = true;
            "devtools.debugger.remote-enabled" = true;
            "devtools.debugger.prompt-connection" = false;
            "devtools.selfxss.count" = 100;
            "ui.key.menuAccessKeyFocuses" = false;
            "browser.startup.homepage" = "https://glance.nebunebu.xyz";
            "browser.startup.page" = 1;
          };
        };
      };
    };
  };
}
