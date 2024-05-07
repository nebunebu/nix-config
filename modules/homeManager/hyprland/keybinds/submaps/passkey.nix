{
  wayland.windowManager.hyprland.extraConfig = ''
    bind = ALT_L, V, submap, passkey
    submap = passkey
    bind = , space, exec, notify-send "passkey submap"
    bind = , escape, submap, reset
    submap = reset
  '';
}
