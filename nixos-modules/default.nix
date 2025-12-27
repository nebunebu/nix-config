{ inputs, pkgs, ... }:

{
  imports = [
    ./avahi.nix
    ./boot.nix
    ./console.nix
    ./dms-greeter.nix
    ./documentation.nix
    ./dotool.nix
    ./hyprland.nix
    ./mango.nix
    ./manpager.nix
    ./networking.nix
    ./nix.nix
    ./obs.nix
    # ./ollama.nix
    ./pipewire.nix
    ./stylix.nix
    ./system.nix
    ./udisks2.nix
    ./users
    ./virtualisation
    ./self-hosted
  ];

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];

  # qt.enable = true;
  # virtualisation.docker.enable = true;
  # nos.window-managers.mango.enable = true;
  #
  # environment = {
  #   systemPackages = [
  #     inputs.direnv-instant.packages.${pkgs.stdenv.hostPlatform.system}.default
  #     inputs.anki.packages.${pkgs.stdenv.hostPlatform.system}.default
  #     pkgs.poppler-utils
  #     # pkgs.winboat
  #     pkgs.quickshell
  #   ];
  # };
}
