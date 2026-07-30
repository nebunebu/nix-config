{ inputs, pkgs, ... }:

{
  imports = [
    ./avahi.nix
    ./boot.nix
    ./console.nix
    ./documentation.nix
    ./dotool.nix
    ./hyprland.nix
    ./manpager.nix
    ./networking.nix
    ./nix.nix
    ./obs.nix
    # ./ollama.nix
    ./pipewire.nix
    ./stylix.nix
    ./system.nix
    ./thunar.nix
    ./tlp.nix
    ./udisks2.nix
    ./self-hosted
  ];

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];
}
