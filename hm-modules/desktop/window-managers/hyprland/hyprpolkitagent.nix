{
  services.hyprpolkitagent = {
    enable = true;
  };

  wayland.windowManager.hyprland.settings.exec-once = [ "systemctl --user start hyprpolkitagent" ];
}
