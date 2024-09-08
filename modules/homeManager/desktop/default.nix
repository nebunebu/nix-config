{ pkgs, ... }:

{
  imports = [
    ./browsers
    ./communication
    ./core
    ./media
    ./productivity
    ./utilities
  ];

  home.packages = [
    pkgs.pavucontrol
    # pkgs.xournalpp
  ];
}
