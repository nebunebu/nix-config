{ lib, ... }:
{
  fileSystems = {
    "/" = {
      device = "/dev/mapper/root_vg-root";
      fsType = "btrfs";
      options = [ "subvol=@root" ];
    };

    "/nix" = {
      device = "/dev/mapper/root_vg-root";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

    "/persist" = {
      device = "/dev/mapper/root_vg-root";
      fsType = "btrfs";
      options = [ "subvol=@persist" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/C708-E996";
      fsType = "vfat";
    };
  };

  boot = {
    initrd = {
      enable = true;
      systemd.enable = true;
    };
    loader = {
      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
        enable = true;
        devices = [ "nodev" ];
      };
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = lib.mkForce false;
      };
    };
  };

  swapDevices = [ ];
}
