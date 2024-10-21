{ lib
, config
, inputs
, pkgs
, ...
}:
let
  cfg = config.core.desktop.hyprland.hyprexpo;
in
{
  options.core.desktop.hyprland.hyprexpo = {
    enable = lib.mkEnableOption "enable hyplrand hyprexpo plugin";
  };

  config = lib.mkIf cfg.enable {
    # NOTE: needs modification to work on
    # NOTE: rotated screen
    wayland.windowManager.hyprland = {
      plugins = [ inputs.hyprland-plugins.packages."${pkgs.system}".hyprexpo ];
      settings = {
        bind = [ "$mainMod, e, hyprexpo:expo, toggle" ];
        "plugin:hyprexpo" = {
          # FIX: incorrect orientation on vertical screen
          columns = 3;
          gap_size = 2;
          # bg_col = "0x${config.stylix.base16Scheme.palette.base00}";
          workspace_method = "first 1";
          # enable_gesture = true; # laptop touchpad
          # gesture_fingers = 3; # 3 or 4
          # gesture_distance = 300; # how far is the "max"
          # gesture_positive = true; # positive =
        };
      };
    };
  };
}
