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
    ./nix-tools.nix
    # ./wallpapers
  ];

  home.packages = builtins.attrValues {
    inherit (pkgs)
      nerdfix
      usbutils
      python3
      vesktop;
      ;
  };
}
