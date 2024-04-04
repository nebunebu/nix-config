{ inputs, ... }:
{
  home.packages = [ inputs.pyprland.packages.x86_64-linux.default ];

  imports = [ ./pyprland.nix ];

  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float, class:^(kitty-btm)$"
        "float, class:^(spotube)$"
      ];
      bind = [
        "ALT_L, b, exec, pypr toggle btm"
        "ALT_L, s, exec, pypr toggle spo"
        "ALT_L, n, exec, pypr toggle noogle"
        "ALT_L, p, exec, pypr toggle nixpkgs"
        "ALT_L, h, exec, pypr toggle hm-options"
        "ALT_L, l, exec, pypr toggle lichess"
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
