{
  inputs,
  pkgs,
  modulesPath,
  ...
}:

# NOTE: Build with:
# NOTE: nix run nixpkgs#nixos-generators --\
# NOTE: --format iso --flake ~/.nix-config#iso -o iso

# nix run .#nixosConfigurations.iso.config.system.build.vm -- -device virtio-vga

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    "${inputs.self}/nixos-modules/console.nix"
    "${inputs.self}/nixos-modules/system.nix"
    "${inputs.self}/nixos-modules/nix.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.system}".default
    pkgs.git
    pkgs.ripgrep
    pkgs.fd
  ];
}
