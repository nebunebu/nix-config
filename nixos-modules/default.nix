{ inputs, pkgs, ... }:

{
  imports = [
    ./amdgpu.nix
    ./boot.nix
    ./console.nix
    ./documentation.nix
    ./hyprland.nix
    ./jellyfin.nix
    ./pipewire.nix
    ./networking.nix
    ./nix.nix
    ./sddm.nix
    ./stylix.nix
    ./system.nix
    ./taskchampion.nix
    ./users
    ./virtualisation
  ];

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.system}".default
  ];
}
