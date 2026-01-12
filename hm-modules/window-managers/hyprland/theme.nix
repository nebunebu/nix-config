{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [ inputs.rosepine.homeManagerModule.rosePine ];

  wayland.windowManager.hyprland = {
    settings = {
      general = {
        "gaps_in" = "4";
        "gaps_out" = "0,2,2,2"; # top,right,bottom,left
        "border_size" = "3";
        "col.active_border" = lib.mkForce "rgb(${config.rosePine.main.gold})";
      };

      decoration = {
        rounding = 2;
        rounding_power = 5.0;
      };
    };
  };
}
