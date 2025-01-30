{ lib, ... }:
{
  imports = [
    ./desktop
    ./development
    ./tablet
    ./terminal
    ./xdg.nix
    ./syncthing.nix
    ./sops.nix
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

  # nixpkgs.config = { allowUnfree = true; };
  systemd.user.startServices = "sd-switch";
}
