{ pkgs, ... }: {
  imports = [
    ./cliphist-menu.nix
    ./power-menu.nix
    ./pass-menu.nix
    # ./screen-capture.sh
  ];

  home.packages = [
    (pkgs.writeShellScriptBin "screen-capture" ''
      ${builtins.readFile ./screen-capture.sh}
    '')
  ];
}
