{ pkgs, ... }:

{
  imports = [
    # ./swww.nix
    ./chromium.nix
    ./firefox
    ./fuzzel
    ./hyprland
    ./kitty.nix
    ./sioyek.nix
    ./swaync
    ./vesktop.nix
    ./waybar
  ];

  home.packages = [
    pkgs.pavucontrol
    pkgs.xournalpp
  ];
}
