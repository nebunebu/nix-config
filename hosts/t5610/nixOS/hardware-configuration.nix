{ config, lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ata_generic"
        "ehci_pci"
        "ahci"
        "xhci_pci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      kernelModules = [ "dm-snapshot" ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/545637e7-7726-4f19-8c14-426a085a2535";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/6512-19D0";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/545637e7-7726-4f19-8c14-426a085a2535";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

    "/persist" = {
      device = "/dev/disk/by-uuid/545637e7-7726-4f19-8c14-426a085a2535";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
