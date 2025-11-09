{
  wayland.windowManager.hyprland.settings.bind = [
    # --- Test Binds for Unused Dispatchers ---

    # Window Management
    "$mainMod, Q, focuswindow, ^(firefox)$"
    "$mainMod, G, togglegroup,"
    "$mainMod, U, focusurgentorlast,"
    "$mainMod + SHIFT, X, forcekillactive,"
    "$mainMod + SHIFT, C, closewindow, ^(kitty)$"
    "$mainMod + SHIFT, K, killwindow, ^(spotify)$"
    "$mainMod + SHIFT, B, pin,"
    "$mainMod + SHIFT, F, setfloating,"
    "$mainMod + SHIFT, T, settiled,"

    # Workspace / Monitor
    "$mainMod, GRAVE, togglespecialworkspace,"
    "$mainMod + SHIFT, P, movetoworkspacesilent, 10"
    "$mainMod, F1, focusmonitor, DP-1"
    "$mainMod, F2, movecurrentworkspacetomonitor, DP-2"
    "$mainMod, F3, moveworkspacetomonitor, 4 DP-1"
    "$mainMod, F4, swapactiveworkspaces, DP-1 DP-2"
    "$mainMod, F5, focusworkspaceoncurrentmonitor, 3"

    # Window/Focus Cycling & Swapping
    "$mainMod, TAB, cyclenext,"
    "$mainMod + SHIFT, TAB, swapnext,"
    "$mainMod, D, swapwindow, r"
    "$mainMod, BRACKETLEFT, focuscurrentorlast,"

    # Window Geometry
    "$mainMod, EQUALS, splitratio, +0.1"
    "$mainMod, MINUS, splitratio, -0.1"
    "$mainMod, F6, alterzorder, top"
    "$mainMod, F7, fullscreenstate, 2 2 set" # Set true fullscreen for app and hyprland
    "$mainMod + SHIFT, E, resizewindowpixel, 10 10, ^(kitty)$"
    "$mainMod + SHIFT, W, movewindowpixel, 10 10, ^(kitty)$"

    # Group Management (Using Ctrl to avoid HJKL conflicts)
    "$mainMod + CONTROL, L, lockgroups, toggle"
    "$mainMod + CONTROL, G, lockactivegroup, toggle"
    "$mainMod + CONTROL, H, moveintogroup, l"
    "$mainMod + CONTROL, O, moveoutofgroup,"
    "$mainMod + CONTROL, J, movewindoworgroup, d"
    "$mainMod + CONTROL, K, movegroupwindow, b"
    "$mainMod + CONTROL, D, denywindowfromgroup, toggle"
    "$mainMod + CONTROL, I, setignoregrouplock, toggle"

    # Advanced / Misc
    "$mainMod, A, execr, kitty" # Raw exec
    "$mainMod, E, pass, ^(firefox)$"
    "$mainMod, F8, forcerendererreload,"
    "$mainMod, F9, renameworkspace, 1, WWW"
    "$mainMod, F10, tagwindow, +testtag"
    "$mainMod, F11, toggleswallow,"
    "$mainMod, F12, setprop, ^(kitty)$, alpha, 0.8"
    "$mainMod + SHIFT, D, dpms, toggle"
    "$mainMod + SHIFT, Z, signal, 9" # Send SIGKILL to active window

    # Cursor
    "$mainMod, HOME, movecursortocorner, 2" # Top-right
    "$mainMod, END, movecursor, 0 0"

    # Dispatchers requiring complex args (examples)
    "$mainMod + SHIFT, S, sendshortcut, SHIFT_ALT, S, ^(gimp)$"
    "$mainMod + SHIFT, K, sendkeystate, CONTROL, C, down, ^(kitty)$"
    "$mainMod + SHIFT, G, global, test.global.shortcut"
    "$mainMod + SHIFT, E, event, mycustomevent:somedata"

    "$mainMod + CONTROL, N, changegroupactive, f" # 'f' for forward
    "$mainMod + CONTROL, P, changegroupactive, b" # 'b' for back
  ];
}
