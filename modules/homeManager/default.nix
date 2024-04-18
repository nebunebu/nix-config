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
    ./cli-tools.nix
    # ./wallpapers
  ];

  home.packages = builtins.attrValues {
    inherit (pkgs)
      python3
      ;
  };
}
