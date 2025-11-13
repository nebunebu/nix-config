{ inputs, pkgs, ... }:

{
  imports = [
    ./avahi.nix
    ./boot.nix
    ./console.nix
    ./dms-greeter.nix
    ./documentation.nix
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
  ];

  opts.window-managers.mango.enable = true;

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".default
    inputs.direnv-instant.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
