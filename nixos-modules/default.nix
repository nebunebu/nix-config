{ inputs, pkgs, ... }:

{
  imports = [
    ./beaverhabits.nix
    ./boot.nix
    ./console.nix
    ./documentation.nix
    ./dumbkan.nix
    ./freshrss.nix
    ./glance
    ./hyprland.nix
    ./jellyfin.nix
    ./linkding.nix
    ./networking.nix
    ./nix.nix
    ./obs.nix
    ./ollama.nix
    ./pinchflat.nix
    ./pipewire.nix
    ./sddm.nix
    ./stylix.nix
    ./system.nix
    ./taskchampion.nix
    ./udisks2.nix
    ./users
    ./virtualisation
  ];

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.system}".default
    inputs.nebvim.packages."${pkgs.system}".manvim
  ];
}
