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
    ./vesktop.nix
    ./waybar
  ];

  home.packages = [
    pkgs.pavucontrol
    pkgs.xournalpp
  ];
}
