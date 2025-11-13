{
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.opts.window-managers.mango;
in
{
  imports = [
    inputs.mango.hmModules.mango
  ];

  options.opts.window-managers.mango = {
    enable = lib.mkEnableOption "enable mango";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.mango = {
      enable = true;
      settings =
        # ini
        ''
          xkb_rules_options=caps:swapescape


          # Window Effects
          # Animations

          # Scroller Layout
          scroller_focus_center=1

          # Master-Stack Layout
          new_is_master=0

          # Overview Settings
          ov_tab_mode=1

          # Miscellaneous

          # Appearance
          borderpx=2
          # rootcolor=
          # bordercolor=0xff6e6a86
          # focuscolor=0xfff6c177
          # maximizescreencolor=
          # urgentcolor=0xeb6f92
          # scratchpadcolor=
          # globalcolor=
          # overlaycolor=


          # Tag Rules
          layout_name=tile

          # Layer Rules

          # Window Rules

          # Monitor Rules

          # Key Bindings

          bind=SUPER,r,reload_config


          # Focus
          bind=SUPER,h,focusdir,left
          bind=SUPER,j,focusdir,down
          bind=SUPER,k,focusdir,up
          bind=SUPER,l,focusdir,right

          bind=SUPER+SHIFT,h,exchange_client,left
          bind=SUPER+SHIFT,j,exchange_client,down
          bind=SUPER+SHIFT,k,exchange_client,up
          bind=SUPER+SHIFT,l,exchange_client,right

          bind=SUPER,0,toggleoverview

          bind=SUPER,f,togglefloating
          bind=SUPER,o,toggleoverlay
          bind=SUPER,m,togglemaximizescreen
          bind=SUPER,n,togglefullscreen
          # bind=SUPER,b,togglefakefullscreen
          bind=SUPER,-,toggleminimized
          bind=Super,=,restore_minimzed
          bind=Super,s,toggle_scratchpad
          bind=Super,z,zoom
          bind=Super,Tab,switch_layout
          bind=Super,t,toggleview


          # bind=SUPER,Return,spawn,kitty
          # bind=SUPER,Return,spawn,ghostty-ogl43
          bind=SUPER,Return,spawn,ghostty-ogl43 -e tmux new-session -A -s main

          bind=SUPER,i,spawn,firefox
          bind=SUPER,x,killclient
          bind=SUPER,p,spawn, dms ipc call spotlight toggle
          bind=SUPER,v,spawn, dms ipc call clipboard toggle

          bind=none,XF86AudioRaiseVolume, spawn, dms ipc call audio increment 3
          bind=none,XF86AudioLowerVolume, spawn, dms ipc call audio decrement 3
          bind=none,XF86AudioMute, spawn, dms ipc call audio mute
          bind=none,XF86AudioMicMute, spawn, dms ipc call audio micmute
        '';
      autostart_sh = # sh
        ''
          dms run -d
        '';
    };
  };
}

# "$mainMod, R, Toggle process list, exec, dms ipc call processlist toggle"
# "$mainMod, N, Toggle notification, exec, dms ipc call notifications toggle"
# "$mainMod, COMMA, Toggle dms settings, exec, dms ipc call settings toggle"
# "$mainMod, SLASH, Toggle hyprland binds, exec, dms ipc call hypr toggleBinds"
# "$mainMod, PERIOD, Restart dms, exec, dms restart"
# "$mainMod, W, Toggle notepad, exec, dms ipc call notepad toggle"
# "$mainMod, O, Toggle hyproveriew, exec, dms ipc call hypr toggleOverview"
# "$mainMod, ESCAPE, Lock screen, exec, dms ipc call lock lock"
#
# "$mainMod, INSERT, Open power menu, exec, dms ipc call powermenu"
# "$mainMod, B, Open wallpaper manager, exec, dms ipc call dankdash wallpaper"
#
# ", XF86MonBrightnessUp, Increase screen brightness, exec, dms ipc call brightness increment 5 "
# ", XF86MonBrightnessDown, Decrease screen brightness, exec, dms ipc call brightness decrement 5 "
