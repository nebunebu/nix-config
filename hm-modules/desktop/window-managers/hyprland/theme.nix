{ lib, config, ... }:
# let
#   borderEdgeGradient = col: (
#     let
#       colorString = c: "rgb(${c}) ";
#       firstColor = lib.concatStrings (lib.replicate 5 (colorString col));
#       secondColor = lib.concatStrings (lib.replicate 5 (colorString config.stylix.base16Scheme.palette.base00));
#     in
#     firstColor + secondColor + "211deg"
#   );
# in
{
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        "gaps_in" = "4";
        # "gaps_out" = "0,12,12,10"; #top,right,bottom,left
        "gaps_out" = "0,2,2,2"; #top,right,bottom,left
        "border_size" = "3";
        "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.palette.base09})";
      };

      decoration = lib.mkForce (removeAttrs
        {
          col.shadow = null;
          shadow = {
            enabled = false;
            range = 1;
            render_power = 4;
            sharp = true;
            # color = "rgba(${config.stylix.base16Scheme.palette.base00}), 0.9"; # base
            # color = "rgb(${config.stylix.base16Scheme.palette.base00})"; # base
            # color = "rgb(${config.stylix.base16Scheme.palette.base02})"; # overlay
            # color = "rgb(${config.stylix.base16Scheme.palette.base0F})"; # highlight medium
            color = "rgb(33,32,46)"; # highlight low
            ignore_window = false;
            offset = "8 8"; # shadow offset
          };

          rounding = "1";
          "active_opacity" = "1";
          "inactive_opacity" = "1";
        } [ "col" ]);

      windowrulev2 = lib.mkForce [
        # NOTE: Border Colors
        "bordercolor rgb(${config.stylix.base16Scheme.palette.base0D}), floating:1"
        "bordercolor rgb(${config.stylix.base16Scheme.palette.base0B}), fullscreen:1"

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
