{ pkgs, ... }:

{
  imports = [
    ./chromium.nix
    ./firefox
    ./fuzzel
    ./hyprland
    ./kitty.nix
    ./sioyek.nix
    ./swaync
    ./swww
    ./vesktop.nix
    ./waybar
  ];

  home.packages = [
    pkgs.pavucontrol
    pkgs.xournalpp
  ];
}
