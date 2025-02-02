{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.tablet.wvkbd;
in
{
  options = {
    tablet.wvkbd.enable = lib.mkEnableOption "enable wvkbd";
  };

  config = lib.mkIf cfg.enable {

    wayland.windowManager.hyprland.settings = {
      exec-once = [ "wvkbd-start" ];
      bind = [ ",XF86TaskPane, exec, pkill -SIGRTMIN wvkbd-mobintl" ];
    };

    home.packages = [
      pkgs.wvkbd
      pkgs.clickclack
      # NOTE: not in nixpkgs
      # https://git.sr.ht/~earboxer/swipeGuess
      (pkgs.writeShellScriptBin "wvkbd-start" ''
        wvkbd-mobintl\
          -R 3\
          --hidden\
          --fn "${config.stylix.fonts.monospace.name}"\
          --bg ${config.stylix.base16Scheme.palette.base00}\
          --fg ${config.stylix.base16Scheme.palette.base0C}\
          --fg-sp ${config.stylix.base16Scheme.palette.base0B}\
          --press ${config.stylix.base16Scheme.palette.base05}\
          --press-sp ${config.stylix.base16Scheme.palette.base04}\
          --swipe ${config.stylix.base16Scheme.palette.base09}\
          --swipe-sp ${config.stylix.base16Scheme.palette.base09}\
          --text ${config.stylix.base16Scheme.palette.base02}\
          --text-sp ${config.stylix.base16Scheme.palette.base05}\
      '')
    ];
  };
}
