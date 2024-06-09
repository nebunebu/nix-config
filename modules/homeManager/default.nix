{ lib, ... }:
{
  imports = [
    # ./awscli.nix
    # ./bat.nix
    # ./chromium
    # ./cli-tools.nix
    ./desktop
    ./development
    ./tablet
    ./terminal
    # ./direnv.nix
    # ./firefox
    # ./fuzzel
    # ./fzf.nix
    # ./git.nix
    # ./hyprland
    # ./kitty.nix
    # ./lf.nix
    # ./mpv.nix
    # ./mpv.nix
    # ./newsboat
    # ./nix-tools.nix
    ./password-store.nix
    # ./sioyek.nix
    # ./swww.nix
    ./syncthing.nix
    # ./taskwarrior.nix
    # ./tmux.nix
    # ./wallpapers
    # ./waybar
    # ./webcord.nix
    # ./xournalpp.nix
    # ./yazi.nix
    # ./zsh
  ];

  home = {
    stateVersion = "23.11";
    username = "nebu";
    homeDirectory = lib.mkForce "/home/nebu";
  };

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    zsh.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
