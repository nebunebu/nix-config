{ pkgs
, inputs
, ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
      inputs.hyprland-plugins.packages."${pkgs.system}".hyprtrails
    ];
    settings = {
      "plugin:borders-plus-plus" = {
        add_borders = 0;
        "col.border_1" = "rgb(ffffff)";
        "col.border_2" = "rgb(2222ff)";
        border_size_1 = 4;
        border_size_2 = -1;
        natural_rounding = "yes";
      };
      "plugin:hyprtrails" = {
        color = "rgba(ffaa00ff)";
      };
    };
  };
}
