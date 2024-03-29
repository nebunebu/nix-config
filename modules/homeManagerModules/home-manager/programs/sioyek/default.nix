{ config, ... }:
let
  c = config.colorScheme.palette;
  c-gray = "#${c.base07}";
  c-red = "#${c.base08}";
  c-yellow = "#${c.base09}";
  c-lteal = "#${c.base0C}";
  c-purple = "#${c.base0D}";
in
{
  programs.sioyek = {
    enable = true;
    bindings = {
      "move_up" = "k";
      "move_down" = "j";
      "move_left" = "h";
      "move_right" = "k";

      "new_window" = "<C-t>";
    };
    config = {
      "default_dark_mode" = "1";
      "dark_mode_background_color" = "#191724";
      "background_color" = "#1f1d2e";
      "visual_mark_color" = "${c-purple}";
      "text_highlight_color" = "${c-lteal}";
      # "custom_background_color" = "#666666";
      # "custom_text_color" = "#e0def4";
      # "status_bar_color" = "49 116 143";
      # "status_bar_text_color" = "1 1 1";
      # "status_bar_font_size" = "1 1 1";
      # "background_color" = "25 23 36";
      # "text_color" = "224 222 244";
    };
  };
}
