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
    ./thunar.nix
    ./udisks2.nix
    ./virtualisation
    ./self-hosted
  ];

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];
}
