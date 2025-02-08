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
        # "gaps_out" = "0,12,12,10"; #top,right,bottom,left
        "gaps_out" = "0,2,2,2"; # top,right,bottom,left
        "border_size" = "3";
        "col.active_border" = lib.mkForce "rgb(${config.rosePine.main.gold})";
      };

      decoration = {
        rounding = 2;
        rounding_power = 5.0;
      };

      windowrulev2 = lib.mkForce [
        # NOTE: Border Colors
        "bordercolor rgb(${config.rosePine.main.iris}), floating:1"
        "bordercolor rgb(${config.rosePine.main.pine}), fullscreen:1"

        "center,floating:1"
        "maxsize 70% 70%, floating:1"

        # Hyprpanel
        "size 90% 90%,class:^(gjs)$,title:^(hyprpanel-settings)$"
        "center,class:^(gjs)$,title:^(hyprpanel-settings)$"

        # NOTE: Firefox Google Sign In
        "float, class:^(firefox)$, initialTitle:^(Sign in - Google Accounts.*)$"
        "center 1, class:^(firefox)$, initialTitle:^(Sign in - Google Accounts.*)$"
        "size 70% 70%, class:^(firefox)$, initialTitle:^(Sign in - Google Accounts.*)$"

        # NOTE: Firefox history manager and others
        "float, class:^(firefox)$, initialTitle:^(Library)$"
        "center 1, class:^(firefox)$, initialTitle:^(Library)$"
        "size 90% 70%, class:^(firefox)$, initialTitle:^(Library)$"

        # NOTE: Tridactyl Editor
        "float, class:^(tridactyl)$"
        "center 1, class:^(tridactyl)$"
        "size 38% 87%, class:^(tridactyl)$"
        "move 60% 5%, class:^(tridactyl)$"
      ];
    };
  };
}
