{
  lib,
  inputs,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.hyprland.hyprgrass;
in
{
  options.neb.desktop.hyprland.hyprgrass.enable = lib.mkEnableOption "enable hyprgrass";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      plugins = [ inputs.hyprgrass.packages."${pkgs.system}".default ];

      extraConfig = # hyprlang
        ''
          plugin:touch_gestures {
            sensitivity = 7.0
            long_press_delay = 400
            workspace_swipe_fingers = 3
            long_press_delay = 400

            hyprgrass-bind = , edge:d:u, exec, firefox
            hyprgrass-bind = , edge:d:l, exec, fuzzel
            hyprgrass-bind = , edge:u:d, exec, [float; noanim; center] kitty
            hyprgrass-bind = , edge:r:l, workspace, +1
            hyprgrass-bind = , edge:l:r, workspace, -1
            # hyprgrass-bind = , tap:3, exec, kitty
            hyprgrass-bindm = , longpress:2, movewindow
            # hyprgrass-bind = , longpress:3, killactive
          }
        '';
    };
  };
}
