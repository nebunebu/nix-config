{
  config,
  lib,
  modulesPath,
  ...
}:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5b45ae49-7f6e-455c-a93b-8b2ea08a158d";
    fsType = "btrfs";
    options = [ "subvol=root" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/5514-4051";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/5b45ae49-7f6e-455c-a93b-8b2ea08a158d";
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/5b45ae49-7f6e-455c-a93b-8b2ea08a158d";
    fsType = "btrfs";
    options = [ "subvol=persist" ];
  };

  swapDevices = [ ];

}
# fileSystems = {
#   "/" = {
#     device = "/dev/disk/by-uuid/79ed30ed-9f0d-452f-b6c8-37e98f87264d";
#     fsType = "btrfs";
#     options = [ "subvol=root" ];
#   };
#
#   "/nix" = {
#     device = "/dev/disk/by-uuid/79ed30ed-9f0d-452f-b6c8-37e98f87264d";
#     fsType = "btrfs";
#     options = [ "subvol=nix" ];
#   };
#
#   "/boot" = {
#     device = "/dev/disk/by-uuid/C773-DA73";
#     fsType = "vfat";
#   };
#
#   "/persist" = {
#     device = "/dev/disk/by-uuid/79ed30ed-9f0d-452f-b6c8-37e98f87264d";
#     fsType = "btrfs";
#     options = [ "subvol=persist" ];
#   };
# };
