{ hex, lib, ... }:
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

in
hexToRGB hex
