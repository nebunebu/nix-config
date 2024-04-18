{ pkgs, ... }: {
  imports = [
    ./cliphist-menu.nix
    ./power-menu.nix
    # ./screen-capture.sh
  ];

  home.packages = [
    (pkgs.writeShellScriptBin "screen-capture" ''
      ${builtins.readFile ./screen-capture.sh}
    '')

    (pkgs.writeShellScriptBin "cheatsheet-menu" ''
      SELECTED=$(ls ~/Media/CheatSheets/ | fuzzel -d -p " ")
      mpv --loop ~/Media/CheatSheets/"$SELECTED"
    '')
  ];
}
