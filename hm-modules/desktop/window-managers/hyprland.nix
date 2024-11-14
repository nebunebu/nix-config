{ inputs
, pkgs
, unstablePkgs
, lib
, config
, ...
}:
let
  cfg = config.neb.desktop.window-managers.hyprland;
in
{
  options.neb.desktop.window-managers.hyprland.enable = lib.mkEnableOption "enable hyprland";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      # package = unstablePkgs.hyprland;
      extraConfig = /* conf */ ''
        env = HYPRLAND_TRACE,1
        env = AQ_TRACE,1
        env = AQ_DRM_DEVICES,/dev/dri/card1
      '';
      # extraConfig = ''
      #   exec-once = tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"
      #   debug:disable_logs = false 
      # '';

      settings = {
        dwindle = {
          preserve_split = true;
        };
        decoration = {
          "rounding" = "10";
          "active_opacity" = "1";
          "inactive_opacity" = "1";
        };

        windowrulev2 = lib.mkForce [
          "bordercolor rgb(${config.stylix.base16Scheme.palette.base0D}), floating:1"
          "bordercolor rgb(${config.stylix.base16Scheme.palette.base0B}), fullscreen:1"
        ];

        general = {
          "gaps_in" = "7";
          "gaps_out" = "8";
          "border_size" = "2";
          "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.palette.base09})";
        };
        misc = {
          "disable_hyprland_logo" = "true";
          "disable_splash_rendering" = "true";
          "mouse_move_enables_dpms" = "true";
          "key_press_enables_dpms" = "false";
          "enable_swallow" = "true";
          "swallow_regex" = [ "kitty" ];
        };
        input = {
          "kb_layout" = "us";
          "kb_options" = "caps:escape";
          "follow_mouse" = "1";
        };
      };
    };
  };
}
