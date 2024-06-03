{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/17d4b436-cfc8-47ee-8f77-50ddd48663e6";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/B134-069D";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/17d4b436-cfc8-47ee-8f77-50ddd48663e6";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/persist" =
    {
      device = "/dev/disk/by-uuid/17d4b436-cfc8-47ee-8f77-50ddd48663e6";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
