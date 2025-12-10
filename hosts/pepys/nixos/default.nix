{
  inputs,
  pkgs,
  modulesPath,
  ...
}:

# NOTE: Build with:
# NOTE: nix run nixpkgs#nixos-generators --\
# NOTE: --format iso --flake ~/.nix-config#pepys -o iso

# nix run .#nixosConfigurations.pepys.config.system.build.vm -- -device virtio-vga

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    "${inputs.self}/nixos-modules/console.nix"
    "${inputs.self}/nixos-modules/system.nix"
    "${inputs.self}/nixos-modules/nix.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  isoImage.squashfsCompression = "gzip";

  environment = {
    systemPackages = [
      inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".default
      pkgs.git
      pkgs.ripgrep
      pkgs.fd
      pkgs.ghostty.terminfo
    ];
  };
}
