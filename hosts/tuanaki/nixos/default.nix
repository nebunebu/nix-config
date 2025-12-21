{
  inputs,
  pkgs,
  modulesPath,
  ...
}:

# NOTE: Build with:
# NOTE: nix run nixpkgs#nixos-generators --\
# NOTE: --format iso --flake ~/.nix-config#tuanaki -o iso

# nix run .#nixosConfigurations.tuanaki.config.system.build.vm -- -device virtio-vga

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    "${inputs.self}/nixos-modules/console.nix"
    "${inputs.self}/nixos-modules/networking.nix"
    "${inputs.self}/nixos-modules/system.nix"
    "${inputs.self}/nixos-modules/nix.nix"
    "${inputs.self}/users/guest"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  networking.hostName = "tuanaki";

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

  nos = {
    nix.enable = true;
    console.enable = true;
    system.enable = true;
    networking.enable = true;
  };
}
