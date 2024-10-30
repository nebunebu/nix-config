{ lib, pkg, ... }:
{
  imports = [
    ./desktop
    ./development
    ./tablet
    ./terminal
    ./password-store.nix
    ./syncthing.nix
    # ./awscli.nix
    # ./bat.nix
    # ./cli-tools.nix
    # ./direnv.nix
    # ./fzf.nix
    # ./git.nix
    # ./lf.nix
    # ./newsboat
    # ./nix-tools.nix
    # ./taskwarrior.nix
    # ./tmux.nix
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
    home-manager = {
      enable = true;
    };
    bash.enable = true;
    zsh.enable = true;
  };

  nixpkgs.config = { allowUnfree = true; };

  systemd.user.startServices = "sd-switch";
}
