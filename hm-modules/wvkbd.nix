{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.wvkbd;
in
{
  options = {
    hm.wvkbd.enable = lib.mkEnableOption "enable wvkbd";
  };

  config = lib.mkIf cfg.enable {

    # NOTE: inert -- Hyprland's config is hand-edited and home-manager's
    # rendered output is disabled (see window-managers/hyprland/default.nix).
    wayland.windowManager.hyprland.settings = {
      exec-once = [ "wvkbd-start" ];
      bind = [ ",XF86TaskPane, exec, pkill -SIGRTMIN wvkbd-mobintl" ];
    };

    home.packages = [
      pkgs.wvkbd
      pkgs.clickclack
      # NOTE: not in nixpkgs
      # https://git.sr.ht/~earboxer/swipeGuess
      # Colors come from the rosé pine palette rather than `config.stylix.*`:
      # the reads here were guarded only by hm.wvkbd.enable, so with
      # `nos.stylix.enable = false` base16Scheme has no value and .palette
      # threw at eval time. One theme dependency, no stylix guard needed.
      (pkgs.writeShellScriptBin "wvkbd-start" ''
        wvkbd-mobintl\
          -R 3\
          --hidden\
          --fn "IBM Plex Mono"\
          --bg ${config.rosePine.main.base}\
          --fg ${config.rosePine.main.foam}\
          --fg-sp ${config.rosePine.main.pine}\
          --press ${config.rosePine.main.text}\
          --press-sp ${config.rosePine.main.subtle}\
          --swipe ${config.rosePine.main.gold}\
          --swipe-sp ${config.rosePine.main.gold}\
          --text ${config.rosePine.main.overlay}\
          --text-sp ${config.rosePine.main.text}\
      '')
    ];
  };
}
