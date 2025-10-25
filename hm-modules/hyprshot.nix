{ lib, config, ... }:

let
  cfg = config.desktop.hyprshot;
in
{
  options.desktop.hyprshot = {
    enable = lib.mkEnableOption "enable hyprshot";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprshot = {
      enable = true;
    };

    wayland.windowManager.hyprland.settings.bind = [
      "$mainMod, ALT_R, exec, hyprshot -m region"
    ];
  };
}
