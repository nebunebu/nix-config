{ pkgs, unstablePkgs, ... }:
{
  imports = [
    ./mpv.nix
    ./sioyek.nix
    ./webcord.nix
    # ./xournalpp.nix
    ./firefox
    ./chromium
  ];

  home.packages = [
    unstablePkgs.element-desktop-wayland
    pkgs.pavucontrol
    # krita
    # gimp
    # thunderbird
  ];
}
