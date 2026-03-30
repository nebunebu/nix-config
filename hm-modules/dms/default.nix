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
      pkgs.i2c-tools
      pkgs.khal
    ];

    programs.dank-material-shell = {
      enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };

      session = {
        isLightMode = false;
        showThirdPartyPlugins = true;
        perMonitorWallpaper = true;
        monitorWallpapers = {
          "DP-1" = builtins.fetchurl {
            url = "https://raw.githubusercontent.com/nebunebu/imgs/refs/heads/main/wallpapers/roseified-wallhaven-l81kkr.jpg";
            sha256 = "05pbqa6dd0xzzx60q6fq56j6zzrga85vlfycnq7ng86zbd2kp5xc";
          };
          "DP-2" = builtins.fetchurl {
            url = "https://raw.githubusercontent.com/nebunebu/imgs/refs/heads/main/wallpapers/roseified-wallhaven-vq6yy5.jpg";
            sha256 = "173d02fmwd2w0jvih35z889dhqxqjwv4j9lchr7calmybvhpv1gr";
          };
        };
      };

      # settings = {
      # };

      # https://raw.githubusercontent.com/nebunebu/imgs/refs/heads/main/pfp-blue.png

      # image = builtins.fetchurl {
      #   url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/nixos-rose-pine.png";
      #   sha256 = "084qgbicqiqwprb9m6l5jwij26rv8r73h76vba523z6q9rz0snlw";
      # };

      enableSystemMonitoring = true; # System monitoring widgets (dgop)
      enableVPN = true; # VPN management widget
      enableDynamicTheming = true; # Wallpaper-based theming (matugen)
      enableAudioWavelength = true; # Audio visualizer (cava)
      enableCalendarEvents = true; # Calendar integration (khal)
      enableClipboardPaste = true; # Pasting items from the clipboard (wtype)
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
        "$mainMod, K, Toggle hyprland keybind popup, exec, dms ipc keybinds toggle hyprland"
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

        ", XF86MonBrightnessUp, Increase screen brightness, exec, dms ipc call brightness increment 5"
        ", XF86MonBrightnessDown, Decrease screen brightness, exec, dms ipc call brightness decrement 5"

        # Cheat Sheet
        "$mainMod + CONTROL, H, Toggle hyprland keybind popup, exec, dms ipc keybinds toggle hyprland"
        "$mainMod + CONTROL, L, Toggle lazygit keybind popup, exec, dms ipc keybinds toggle lazygit"
        "$mainMod + CONTROL, M, Toggle mpv keybind popup, exec, dms ipc keybinds toggle mpv"
        "$mainMod + CONTROL, S, Toggle sioyek keybind popup, exec, dms ipc keybinds toggle sioyek"
        "$mainMod + CONTROL, T, Toggle tmux keybind popup, exec, dms ipc keybinds toggle tmux"
        "$mainMod + CONTROL, V, Toggle vesktop keybind popup, exec, dms ipc keybinds toggle vesktop"
        "$mainMod + CONTROL, Y, Toggle yazi keybind popup, exec, dms ipc keybinds toggle yazi"
      ];
    };
  };
}
