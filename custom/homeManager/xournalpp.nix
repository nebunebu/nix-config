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

    # TODO: set correct types
    # There should be 11 colors
    palette = lib.mkOption {
      type = lib.types.anything;
      default = {
        "Black" = "000000";
        "Green" = "008000";
        "Light Blue" = "00C0FF";
        "Light Green" = "00FF00";
        "Blue" = "3333CC";
        "Gray" = "808080";
        "Red" = "FF0000";
        "Magenta" = "FF00FF";
        "Orange" = "FF8000";
        "Yellow" = "FFFF00";
        "White" = "FFFFFF";
      };
      example = {
        "Black" = "000000";
        "Green" = "008000";
        "Light Blue" = "00C0FF";
        "Light Green" = "00FF00";
        "Blue" = "3333CC";
        "Gray" = "808080";
        "Red" = "FF0000";
        "Magenta" = "FF00FF";
        "Orange" = "FF8000";
        "Yellow" = "FFFF00";
        "White" = "FFFFFF";
      };
      description = "color palette (recommended to use at least 11 colors)";
    };

    pagetemplate = lib.mkOption {
      type = lib.types.lines;
      default = /* ini */ ''''';
      # example = /* ini */ ''''';
      description = "page template";
    };
    # conf = {};
    # cache
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.xournalpp
      pkgs.gnome.adwaita-icon-theme
    ];

    xdg.configFile."xournalpp/palette.gpl".text =
      let
        base16AttrSet = {
          "0" = 0;
          "1" = 1;
          "2" = 2;
          "3" = 3;
          "4" = 4;
          "5" = 5;
          "6" = 6;
          "7" = 7;
          "8" = 8;
          "9" = 9;
          "a" = 10;
          "A" = 10;
          "b" = 11;
          "B" = 11;
          "c" = 12;
          "C" = 12;
          "d" = 13;
          "D" = 13;
          "e" = 14;
          "E" = 14;
          "f" = 15;
          "F" = 15;
        };

        hexCharList = x:
          lib.stringToCharacters x;

        rgbHelper = str: i: j:
          (base16AttrSet.${lib.strings.elemAt (hexCharList str) i} * 16)
          + (base16AttrSet.${lib.strings.elemAt (hexCharList str) j});

        hexToRGB = x:
          "${builtins.toString (rgbHelper x 0 1)} ${builtins.toString (rgbHelper x 2 3)} ${builtins.toString (rgbHelper x 4 5)}";

        header = [ "GIMP Palette" "Name: Xournal Default Palette" "#" ];
      in
      lib.concatLines (header ++ (lib.attrsets.mapAttrsToList (n: v: "${hexToRGB v} ${n}") cfg.palette));

    xdg.configFile."xournalpp/pagetemplate.ini".text = lib.mkDefault cfg.pagetemplate;
  };
}
