{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/697d245d-bfc8-49d6-990e-16c921b51d17";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/C708-E996";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/697d245d-bfc8-49d6-990e-16c921b51d17";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

    "/persist" = {
      device = "/dev/disk/by-uuid/697d245d-bfc8-49d6-990e-16c921b51d17";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };
  };

  boot.loader = {
    grub = {
      enable = true;
      devices = [ "nodev" ];
    };
    efi.efiSysMountPoint = "/boot";
  };

  swapDevices = [ ];
}
