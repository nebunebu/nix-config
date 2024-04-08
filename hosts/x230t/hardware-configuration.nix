{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/78522870-361e-489f-8b7a-2c5844d38663";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/78522870-361e-489f-8b7a-2c5844d38663";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/3CD0-3588";
      fsType = "vfat";
    };

  fileSystems."/persist" =
    {
      device = "/dev/disk/by-uuid/78522870-361e-489f-8b7a-2c5844d38663";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
