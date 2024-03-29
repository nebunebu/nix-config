{ config, ... }:
let
  c = config.colorScheme.palette;
  c-gray = "0xff${c.base07}";
  c-red = "0xff${c.base08}";
  c-yellow = "0xff${c.base09}";
  c-lteal = "0xff${c.base0C}";
  c-purple = "0xff${c.base0D}";
in
{
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        "gaps_in" = "7";
        "gaps_out" = "8";
        "border_size" = "2";
        "col.active_border" = "${c-yellow}";
        "col.inactive_border" = "${c-gray}";
      };

      decoration = {
        "rounding" = "10";
        "active_opacity" = "1";
        "inactive_opacity" = "1";
      };

      windowrulev2 = [
        "bordercolor ${c-purple}, fullscreen:1"
        "bordercolor ${c-lteal}, floating:1"
        "bordercolor ${c-red}, pinned:1"
      ];
    };

    # extraConfig = ''
    #   general {
    #   		# col.shadow = 0xee1a1a1a
    #       col.active_border = ${c-yellow} ${c-black}
    #       col.inactive_border = ${c-gray1}
    #       bezier = linear, 0.0, 0.0, 1.0, 1.0
    #   }
    #
    #     animations {
    #         enabled = yes
    #         animation = borderangle, 1, 60, linear, loop
    #     }
    # '';
  };
}
