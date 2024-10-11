{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ inputs.hyprland-plugins.packages."${pkgs.system}".hyprtrails ];
    settings = {
      "plugin:hyprtrails" = {
        color = "rgba(ffaa00ff)";
      };
    };
  };
}
