{ pkgs, ... }: {
  home.packages = [
    (pkgs.writeShellScriptBin "cliphist-menu" ''
      cliphist list | fuzzel -p "󰅌 " -d -l 30 -w 125 -P 15 | cliphist decode | wl-copy
    '')
  ];
}
