{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "cliphist-menu" ''
      cliphist list | fuzzel -p "󰅌 " -d -l 25 -w 70 -P 15 | cliphist decode | wl-copy
    '')
  ];
}
