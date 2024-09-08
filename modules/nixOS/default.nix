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
    ./sddm.nix
    ./stylix.nix
    ./system.nix
    ./users
    ./virtualisation
  ];

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.system}".default
    inputs.zen-browser.packages."${pkgs.system}".generic
    # pkgs.hyprpanel
  ];
}
