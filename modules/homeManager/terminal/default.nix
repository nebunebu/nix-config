{ pkgs, ... }:
{
  imports = [
    ./lf.nix
    ./bat.nix
    ./buku.nix
    ./fzf.nix
    ./tmux.nix
    ./yazi.nix
    ./cli-tools.nix
    ./nix-tools.nix
    ./taskwarrior.nix
    ./zsh
    ./newsboat
  ];

  home.packages = [
    # ffmpeg
    # distrobox
    pkgs.lazygit
    # invidtui
  ];
}
