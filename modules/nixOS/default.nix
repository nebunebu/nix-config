{ inputs, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./console.nix
    ./documentation.nix
    ./hasSecrets
    ./hyprland.nix
    ./networking.nix
    ./nix.nix
    ./sddm
    ./stylix.nix
    ./system.nix
    ./users
    ./virtualisation
  ];

  environment.systemPackages = [
    # inputs.nixvim-flake.packages.x86_64-linux.default
    # inputs.my-nvim.packages.x86_64-linux.mvim
    inputs.nebvim.packages."${pkgs.system}".default
  ];
}
