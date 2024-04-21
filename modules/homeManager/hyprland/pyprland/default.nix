{ inputs, pkgs, unstablePkgs, ... }:
{
  home.packages = [
    inputs.pyprland.packages.x86_64-linux.default
    unstablePkgs.spotube
    pkgs.bottom
  ];

  imports = [ ./pyprland.nix ];

  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float, class:^(kitty-btm)$"
        "float, class:^(spotube)$"
        "float, class:^(firefox)$"
      ];
      bind = [
        "ALT_L, b, exec, pypr toggle btm"
        "ALT_L, s, exec, pypr toggle spo"
        "ALT_L, n, exec, pypr toggle noogle"
        "ALT_L, p, exec, pypr toggle nixpkgs"
        "ALT_L, h, exec, pypr toggle hm-options"
        "ALT_L, l, exec, pypr toggle lichess"
        "ALT_L, c, exec, pypr toggle claude"
      ];

    };

    # NOTE: for creating a submap
    #   extraConfig = ''
    #     bind = $mainMod, S, submap, scratchpad
    #     submap = scratchpad
    #     bind = , B, exec, pypr show btm
    #     bind = , S, exec, pypr show spo
    #     bind = , escape, exec, pypr hide btm
    #     bind = , escape, exec, pypr hide spo
    #     bind = , escape, submap, reset
    #     submap = reset
    #   '';
  };
}
