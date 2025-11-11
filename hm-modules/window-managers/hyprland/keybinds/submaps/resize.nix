{
  # NOTE: set keybinds to move focused window to screen region
  # NOTE: set keybinds to pin window
  # NOTE: set keybinds to return splits if messing with tiling size of windows
  # NOTE: should probably move mouse off windows
  wayland.windowManager.hyprland.extraConfig = ''
    bind = ALT_L, R, exec, hyprctl keyword input:follow_mouse 3
    bind = ALT_L, R, submap, resize
    submap = resize
    binde = , H, resizeactive, -10 0
    binde = , J, resizeactive, 0 10
    binde = , K, resizeactive, 0 -10
    binde = , L, resizeactive, 10 0

    binde = SHIFT, H, moveactive, -10 0
    binde = SHIFT, J, moveactive, 0 10
    binde = SHIFT, K, moveactive, 0 -10
    binde = SHIFT, L, moveactive, 10 0

    bind = , SPACE, centerwindow

    bind = , escape, exec, hyprctl keyword input:follow_mouse 0
    bind = , escape, submap, reset
    submap = reset
  '';
}
