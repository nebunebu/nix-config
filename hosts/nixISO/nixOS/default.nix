{ self, pkgs, modulesPath, ... }:

# NOTE: Build with:
# NOTE:   nix run nixpkgs#nixos-generators --\
# NOTE:   --format iso --flake ~/.nix-config#nixISO -o nixISO

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    "${self}/modules/nixOS/console.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  environment.systemPackages = [
    pkgs.git
    pkgs.ripgrep-all
  ];

  system.stateVersion = "23.11";
}
