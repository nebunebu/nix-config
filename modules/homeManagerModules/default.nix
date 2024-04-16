{ pkgs, ... }:

{
  imports = [
    ./git
    ./kitty
    ./hyprland
    ./sioyek
    ./tmux
    ./zsh.nix
    ./theme
    ./taskwarrior
    ./waybar
    ./fuzzel
    ./webcord.nix
    ./swww
    # ./wallpapers
  ];

  home.packages = builtins.attrValues {
    inherit (pkgs)
      nerdfix
      comma
      usbutils
      python3
      vesktop;
  };
}
