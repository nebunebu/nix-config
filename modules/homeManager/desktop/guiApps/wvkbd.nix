{ pkgs, unstablePkgs, ... }:

{
  home.packages = [
    unstablePkgs.wvkbd
    pkgs.clickclack
    # NOTE: not in nixpkgs
    # https://git.sr.ht/~earboxer/swipeGuess
    # TODO: add font and other options
    # --alpha 255\
    # --fg c4a7e7\
    (pkgs.writeShellScriptBin "wvkbd-start" ''
      wvkbd-mobintl\
        -R 3\
        --hidden\
        --bg 19172400\
        --fg 191724\
        --fg-sp 9ccfd8\
        --press eb6f92\
        --press-sp f6c177\
        --swipe 31748f\
        --swipe-sp ebbcba\
        --text e0def4\
        --text-sp 524f67 
    '')
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [ "wvkbd-start" ];
    bind = [
      ",XF86TaskPane, exec, pkill -SIGRTMIN wvkbd-mobintl"
    ];
  };
}
