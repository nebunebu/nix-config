{ lib, config, pkgs, ... }:
let
  cfg = config.programs.xournalpp;
in
{
  options.programs.xournalpp = {
    enable = lib.mkEnableOption "enable xournalpp program";

    # package =;

    # NOTE: use builtins.toXML
    # settings = ;

    # NOTE: use lib.generators.toINI
    # colornames = ;

    # NOTE: use lib.generators.toINI
    palette = lib.mkOption {
      type = lib.types.lines;
      default = /* gpl */ ''
        GIMP Palette
        Name: Xournal Default Palette
        #
        0 0 0 Black
        0 128 0 Green
        0 192 255 Light Blue
        0 255 0 Light Green
        51 51 204 Blue
        128 128 128 Gray
        255 0 0 Red
        255 0 255 Magenta
        255 128 0 Orange
        255 255 0 Yellow
        255 255 255 White
      '';
      example = "
        GIMP Palette
        Name: Xournal Default Palette
        #
        0 0 0 Black
        0 128 0 Green
        0 192 255 Light Blue
        0 255 0 Light Green
        51 51 204 Blue
        128 128 128 Gray
        255 0 0 Red
        255 0 255 Magenta
        255 128 0 Orange
        255 255 0 Yellow
        255 255 255 White
      ";
      description = "color palette";
    };

    # pagetemplate = {};
    # conf = {};
    # cache
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.xournalpp
      pkgs.gnome.adwaita-icon-theme
    ];


    xdg.configFile."xournalpp/palette.gpl".text = lib.mkDefault cfg.palette;
  };
}
