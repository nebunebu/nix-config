{ lib, config, ... }:
let
  borderEdgeGradient = col: (
    let
      colorString = c: "rgb(${c}) ";
      firstColor = lib.concatStrings (lib.replicate 5 (colorString col));
      secondColor = lib.concatStrings (lib.replicate 5 (colorString config.stylix.base16Scheme.palette.base00));
    in
    firstColor + secondColor + "211deg"
  );
in
{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = lib.mkForce (removeAttrs
        {
          col.shadow = null;
          shadow = {
            enabled = true;
            range = 1;
            render_power = 4;
            sharp = true;
            color = "rgba(25, 23, 36, 1.0)"; # base
            # color = "rgba(246, 193, 119, 1.0)"; # gold
            # color_inactive = "rgba(49, 116, 143, 1.0)"; #pine
            # color_inactive = borderEdgeGradient config.stylix.base16Scheme.palette.base0D;
            ignore_window = false;
            offset = "12 12";
          };

          rounding = "0";
          "active_opacity" = "1";
          "inactive_opacity" = "1";
        } [ "col" ]);

      windowrulev2 = lib.mkForce [
        "bordercolor ${borderEdgeGradient config.stylix.base16Scheme.palette.base0D}, floating:1"
        "bordercolor ${borderEdgeGradient config.stylix.base16Scheme.palette.base0B}, fullscreen:1"
        # "bordercolor ,${borderEdgeGradient config.stylix.base16Scheme.palette.base0D}, fullscreen:1"
      ];

      general = {
        "gaps_in" = "12";
        "gaps_out" = "15";
        "border_size" = "4";
        "col.active_border" = lib.mkForce "rgb($config.stylix.base16Scheme.palette.base09)";
        # "col.active_border" = lib.mkForce (
        #   "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 1. Gold
        #   "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 2. Gold
        #   "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 3. Gold
        #   "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 4. Gold
        #   "rgb(${config.stylix.base16Scheme.palette.base09}) " + # 5. Gold
        #   "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 6. Black
        #   "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 7. Black
        #   "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 8. Black
        #   "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 9. Black
        #   "rgb(${config.stylix.base16Scheme.palette.base00}) " + # 10. Black
        #   "211deg"
        # );
      };
    };
  };
}
