{ inputs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprgrass.packages.x86_64-linux.default
    ];

    extraConfig = /* hyprlang */ ''
      plugin:touch_gestures {
        sensitivity = 4.0
        long_press_delay = 400
        hyprgrass-bind = , edge:d:u, exec, firefox
      }
    '';
  };
}
