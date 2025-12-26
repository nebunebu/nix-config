{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
let
  cfg = config.hm.dms;
in
{
  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
  ];

  options.hm.dms = {
    enable = lib.mkEnableOption "enable Dank Material";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      pkgs.python3
      pkgs.material-symbols
      pkgs.cava
      pkgs.wl-clipboard
    ];

    programs.dank-material-shell = {
      enable = true;
      enableDynamicTheming = false;
    };

    home.sessionVariables = {
      "DMS_DISABLE_MATUGEN" = "1";
      "DMS_DANKBAR_LAYER" = "bottom";
    };

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "bash -c \"${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store &\""
        "dms run"
      ];
      bindd = [
        "$mainMod, P, Toggle launcher, exec, dms ipc call spotlight toggle"
        "$mainMod, V, Toggle clipboard menu, exec, dms ipc call clipboard toggle"
        "$mainMod, R, Toggle process list, exec, dms ipc call processlist toggle"
        "$mainMod, N, Toggle notification, exec, dms ipc call notifications toggle"
        "$mainMod, COMMA, Toggle dms settings, exec, dms ipc call settings toggle"
        "$mainMod, SLASH, Toggle hyprland binds, exec, dms ipc call hypr toggleBinds"
        "$mainMod, PERIOD, Restart dms, exec, dms restart"
        "$mainMod, W, Toggle notepad, exec, dms ipc call notepad toggle"
        "$mainMod, O, Toggle hyproveriew, exec, dms ipc call hypr toggleOverview"
        "$mainMod, ESCAPE, Lock screen, exec, dms ipc call lock lock"

        # Audio Controls
        ", XF86AudioRaiseVolume, Increase Volume, exec, dms ipc call audio increment 3"
        ", XF86AudioLowerVolume, Decrease Volume, exec, dms ipc call audio decrement 3"
        ", XF86AudioMute, Mute audio, exec, dms ipc call audio mute"
        ", XF86AudioMicMute, Mute Mic, exec, dms ipc call audio micmute"

        "$mainMod, INSERT, Open power menu, exec, dms ipc call powermenu"
        "$mainMod, B, Open wallpaper manager, exec, dms ipc call dankdash wallpaper"

        ", XF86MonBrightnessUp, Increase screen brightness, exec, dms ipc call brightness increment 5 "
        ", XF86MonBrightnessDown, Decrease screen brightness, exec, dms ipc call brightness decrement 5 "
        # "$mainMod, N, exec, dms ipc call night toggle"
      ];
    };
  };
}
