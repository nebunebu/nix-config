{
  config,
  lib,
  modulesPath,
  ...
}:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/79ed30ed-9f0d-452f-b6c8-37e98f87264d";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/79ed30ed-9f0d-452f-b6c8-37e98f87264d";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/C773-DA73";
      fsType = "vfat";
    };

    "/persist" = {
      device = "/dev/disk/by-uuid/79ed30ed-9f0d-452f-b6c8-37e98f87264d";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };
  };
}
