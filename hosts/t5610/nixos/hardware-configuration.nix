{
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
}
