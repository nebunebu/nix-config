{ lib, config, ... }:
let
  cfg = config.desktop.media.sioyek;
in
{
  options = {
    desktop.media.sioyek.enable = lib.mkEnableOption "enable sioyek";
  };

  config = lib.mkIf cfg.enable {
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
      };
    };
  };
}
