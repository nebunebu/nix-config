{ pkgs, unstablePkgs, ... }:
{
  imports = [
    ./hyprland
    ./waybar
  ];

  home.packages = [
    unstablePkgs.element-desktop-wayland
    pkgs.pavucontrol
    pkgs.libnotify
    # krita
    # gimp
    # thunderbird
    # fd
    # bottom
    # ffmpeg
    # distrobox
    pkgs.lazygit
    # invidtui
  ];
}
