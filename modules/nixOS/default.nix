{ inputs, ... }:

{
  imports = [
    ./boot.nix
    ./console.nix
    ./documentation.nix
    ./hasSecrets
    ./hyprland.nix
    ./networking.nix
    ./nix.nix
    ./sddm.nix
    ./system.nix
    ./users
    ./virtualisation
  ];

  environment.systemPackages = [ inputs.nixvim-flake.packages.x86_64-linux.default ];
}
