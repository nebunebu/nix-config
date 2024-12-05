{ lib
, config
, unstablePkgs
, ...
}:
# NOTE: all this should be under browsers
let
  cfg = config.neb.desktop.media.glance;
in
{

  options = {
    neb.desktop.media.glance.enable = lib.mkEnableOption "enable glance";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ unstablePkgs.glance ];

    wayland.windowManager.hyprland.settings.exec-once = [
      "${unstablePkgs.glance}/bin/glance -config ${config.xdg.configHome}/glance/glance.yaml"
    ];

  };
}


