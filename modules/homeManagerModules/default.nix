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
    ./webcord
    # ./swww
    # ./wallpapers
  ];

  home.packages = with pkgs; [
    nerdfix
    comma
    usbutils
  ];
}
