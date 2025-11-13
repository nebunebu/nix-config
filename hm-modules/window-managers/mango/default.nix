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
        # conf

        ''
          xkb_rules_options=caps:swapescape
          new_is_master=false

          bind=SUPER,Return,spawn,kitty
          bind=SUPER,i,spawn,firefox
          bind=SUPER,x,killclient
          bind=SUPER,p,spawn, dms ipc call spotlight toggle
          bind=SUPER,v,spawn, dms ipc call clipboard toggle

          bind=,XF86AudioRaiseVolume, spawn, dms ipc call audio increment 3
          bind=,XF86AudioLowerVolume, spawn, dms ipc call audio decrement 3
          bind=,XF86AudioMute, spawn, dms ipc call audio mute
          bind=,XF86AudioMicMute, spawn, dms ipc call audio micmute

          gesturebind=down,2,toggleoverview
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
# # Audio Controls
# ", XF86AudioRaiseVolume, Increase Volume, exec, dms ipc call audio increment 3"
# ", XF86AudioLowerVolume, Decrease Volume, exec, dms ipc call audio decrement 3"
# ", XF86AudioMute, Mute audio, exec, dms ipc call audio mute"
# ", XF86AudioMicMute, Mute Mic, exec, dms ipc call audio micmute"
#
# "$mainMod, INSERT, Open power menu, exec, dms ipc call powermenu"
# "$mainMod, B, Open wallpaper manager, exec, dms ipc call dankdash wallpaper"
#
# ", XF86MonBrightnessUp, Increase screen brightness, exec, dms ipc call brightness increment 5 "
# ", XF86MonBrightnessDown, Decrease screen brightness, exec, dms ipc call brightness decrement 5 "
