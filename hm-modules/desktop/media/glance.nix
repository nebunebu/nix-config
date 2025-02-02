{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.media.glance;
in
{

  options = {
    neb.desktop.media.glance.enable = lib.mkEnableOption "enable glance";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.glance ];

    wayland.windowManager.hyprland.settings.exec-once = [
      "${pkgs.glance}/bin/glance -config ${config.xdg.configHome}/glance/glance.yaml"
    ];

  };
}
