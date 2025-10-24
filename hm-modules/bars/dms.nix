{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
let
  cfg = config.desktop.bars.dms;
in
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  options.desktop.bars.dms = {
    enable = lib.mkEnableOption "enable Dank Material";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      pkgs.material-symbols
      pkgs.cava
      pkgs.wl-clipboard
    ];

    programs.dankMaterialShell = {
      enable = true;
      enableDynamicTheming = false;
    };

    home.sessionVariables = {
      "DMS_DISABLE_MATUGEN" = "1";
    };

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "bash -c \"${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store &\""
        "dms run"
      ];
      bind = [
        "$mainMod, P, exec, dms ipc call spotlight toggle"
        "$mainMod, V, exec, dms ipc call clipboard toggle"
        "$mainMod, R, exec, dms ipc call processlist toggle"
        "$mainMod, N, exec, dms ipc call notifications toggle"
        "$mainMod, comma, exec, dms ipc call settings toggle"
        "$mainMod, W, exec, dms ipc call notepad toggle"
        "$mainMod, O, exec, dms ipc call hypr toggleOverview"
        "$mainMod, ESCAPE, exec, dms ipc call lock lock"

        # Audio Controls
        ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
        ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
        ", XF86AudioMute, exec, dms ipc call audio mute"
        ", XF86AudioMicMute, exec, dms ipc call audio micmute"

        "$mainMod, INSERT, exec, dms ipc call powermenu"
        "$mainMod, B, exec, dms ipc call dankdash wallpaper"
        # "$mainMod, , exec, dms ipc call call control-center toggle"

        ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 "
        ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 "
        # "$mainMod, N, exec, dms ipc call night toggle"
      ];
    };
  };
}
