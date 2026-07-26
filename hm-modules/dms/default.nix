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
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.homeModules.default
    ./settings.nix
  ];

  options.hm.dms = {
    enable = lib.mkEnableOption "enable Dank Material";
  };

  config = lib.mkIf cfg.enable {

    home = {
      packages = [
        pkgs.python3
        pkgs.material-symbols
        pkgs.cava
        pkgs.wl-clipboard
        pkgs.i2c-tools
        pkgs.khal
      ];

      sessionVariables = {
        "DMS_DISABLE_MATUGEN" = "1";
        "DMS_DANKBAR_LAYER" = "bottom";
      };

      # Seeded once into a real, writable file/dir below instead of a read-only
      # xdg.configFile symlink, so DMS (and the user) can edit them at runtime
      # without home-manager clobbering the changes on the next switch.
      activation.dmsCheatsheetsSeed = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        target="$HOME/.config/DankMaterialShell/cheatsheets"
        if [[ ! -e "$target" ]]; then
          run mkdir -p $VERBOSE_ARG "$HOME/.config/DankMaterialShell"
          run cp -r $VERBOSE_ARG ${./cheatsheets} "$target"
          run chmod -R u+w $VERBOSE_ARG "$target"
        fi
      '';
    };

    # Stylix auto-targets DMS (fonts/opacity/theme colors/wallpaper) by writing
    # programs.dank-material-shell.settings/.session itself, independent of
    # ./settings.nix. That would put us right back to a read-only, clobbered
    # settings.json/session.json, so it's disabled here too.
    stylix.targets."dank-material-shell".enable = false;

    # xdg.configFile."DankMaterialShell/themes" = {
    #   recursive = true;
    # };

    programs.dank-material-shell = {
      enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };

      # session.json (light/dark mode, per-monitor wallpaper) is also written by DMS at
      # runtime, so it's left unset here and seeded once from a mutable backup instead
      # (see ./settings.nix) rather than forced through `programs.dank-material-shell.session`,
      # which would make it a read-only Nix-store symlink like settings.json was.

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

      plugins = {
        desktopCommand.enable = true;
        taskwarrior.enable = true;
        dankPomodoroTimer.enable = true;
        hyprlandSubmap.enable = true;
        dankHooks.enable = true;
      };
    };

    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "bash -c \"${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store &\""
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
