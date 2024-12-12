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
        "gaps_in" = "8";
        "gaps_out" = "0,12,12,10"; #top,right,bottom,left
        "border_size" = "3";
        "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.palette.base09})";
      };

      decoration = lib.mkForce (removeAttrs
        {
          col.shadow = null;
          shadow = {
            enabled = true;
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
        "bordercolor rgb(${config.stylix.base16Scheme.palette.base0D}), floating:1"
        "bordercolor rgb(${config.stylix.base16Scheme.palette.base0B}), fullscreen:1"
        # none create window rule so that title:Sign in - Google Accounts — Mozilla Firefox floats 1.
        "float, center, size 50% 50%, class:^(firefox)$, title:^(Sign in - Google Accounts.*)$"
      ];
    };
  };
}
