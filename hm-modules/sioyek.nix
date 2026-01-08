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
    home.packages = [
      pkgs.pdftk
      pkgs.python3
    ];
    programs.sioyek = {
      enable = true;
      bindings = {
        "move_up" = "k";
        "move_down" = "j";
        "move_left" = "h";
        "move_right" = "l";

        "new_window" = "<C-t>";
      };
      config = {
        "default_dark_mode" = "0";
        "dark_mode_background_color" = "#191724";
        "background_color" = "#1f1d2e";

        "new_command _dual_panelify" = ''
          python -m sioyek.dual_panelify "%{sioyek_path}" "%{file_path}" "%{command_text}"
        '';

        "new_command _extract_highlights" = ''
          python -m sioyek.extract_highlights "%{sioyek_path}" "%{local_database}" "%{shared_database}" "%1" %{zoom_level}
        '';
      };
    };
  };
}
