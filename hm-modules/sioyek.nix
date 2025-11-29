{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.hm.sioyek;
in
{
  options = {
    hm.sioyek.enable = lib.mkEnableOption "enable sioyek";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pdftk ];
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
        "default_dark_mode" = "0";
        "dark_mode_background_color" = "#191724";
        "background_color" = "#1f1d2e";

        # pdftk "$1" cat $2-$3 output "${1%.pdf}_pages_${2}-${3}.pdf"
        # new_command _extract_pages /path/to/extract_pages.sh "%{file_path}" [start] [end]
      };
    };
  };
}
