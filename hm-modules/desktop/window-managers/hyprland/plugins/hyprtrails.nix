{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".hyprtrails ];
    settings = {
      "plugin:hyprtrails" = {
        color = "rgba(ffaa00ff)";
      };
    };
  };
}
