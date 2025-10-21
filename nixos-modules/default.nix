{ inputs, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./console.nix
    ./documentation.nix
    ./hyprland.nix
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
  ];

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.system}".default
    inputs.direnv-instant.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
