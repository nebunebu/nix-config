{ lib, config, pkgs, ... }:
let
  cfg = config.neb.desktop.productivity.keycombiner;
in
{
  options = {
    neb.desktop.productivity.keycombiner.enable = lib.mkEnableOption "enable keycombiner";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.appimageTools.wrapType2 {
        name = "keycombiner";
        src = pkgs.fetchurl {
          url = "https://keycombiner.com/download/KeyCombiner-0.8.0.AppImage";
          sha256 = "sha256-N3NI4gfFYU1gDKDKLaWI/XggbqUs19EV18oAhrF5u/8=";
        };
      })
    ];

    xdg = {
      enable = true;
      desktopEntries = {
        keycombiner = {
          name = "KeyCombiner";
          genericName = "Keyboard Shortcut Training";
          exec = "keycombiner";
          terminal = false;
          categories = [ "Application" "Education" ];
          icon = "keycombier";
          comment = "Learn and practice keyboar shortcuts";
        };
      };
    };
  };
}
