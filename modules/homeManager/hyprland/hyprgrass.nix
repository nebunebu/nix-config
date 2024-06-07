{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprgrass.packages."${pkgs.system}".default
    ];

    extraConfig = /* hyprlang */ ''
      plugin:touch_gestures {
        sensitivity = 4.0
        long_press_delay = 400
        hyprgrass-bind = , edge:d:u, exec, firefox
        hyprgrass-bind = , edge:u:d, exec, kitty
      }
    '';
  };
}
