{ pkgs, ... }:
{
  imports = [
    ./git
    ./kitty
    ./hyprland
    ./sioyek
    ./tmux
    ./zsh
    ./theme
    ./taskwarrior
    ./waybar
    ./fuzzel
    # ./swww
    # ./wallpapers
  ];

  home.packages = with pkgs; [
    nerdfix
    comma
    usbutils
  ];
}
