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

  services.avahi = {
    enable = true;
    nssmdns = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.system}".default
    inputs.direnv-instant.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
