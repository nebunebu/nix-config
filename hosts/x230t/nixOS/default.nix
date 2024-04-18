{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixOS
    inputs.home-manager.nixosModules.default
    inputs.niri.nixosModules.niri
  ];

  desktop.hyprland.enable = true;

  networking.hostName = "x230t";
  environment = {
    sessionVariables = {
      HOSTNAME = "x230t";
    };
    etc."machine-id" = {
      text = "78565725a9e64e86b54c846719ef1aa4";
      mode = "0444";
    };
  };

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    # grub.efiInstallAsRemovable = true;
    # efi.efiSysMountPoint = "/boot/efi";
    # Define on which hard drive you want to install Grub.
    device = "nodev"; # or "nodev" for efi only
  };
}
