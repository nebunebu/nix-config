# NOTE: This is a generated file from the disko configuration.
# You should verify the device paths and UUIDs before using.
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # Filesystems
  # NOTE: Replace /dev/nvme0n1pX with the actual device paths or UUIDs.
  # You can find UUIDs with `ls -l /dev/disk/by-uuid`
  fileSystems = {
    "/" = {
      device = "/dev/nvme0n1p2";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd"
        "noatime"
      ];
    };

    "/boot" = {
      device = "/dev/nvme0n1p1";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/nvme0n1p2";
      fsType = "btrfs";
      options = [
        "subvol=@nix"
        "compress=zstd"
        "noatime"
      ];
    };

    "/persist" = {
      device = "/dev/nvme0n1p2";
      fsType = "btrfs";
      options = [
        "subvol=@persist"
        "compress=zstd"
        "noatime"
      ];
    };
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
