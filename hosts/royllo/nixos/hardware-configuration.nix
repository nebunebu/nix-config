{
  pkgs,
  ...
}:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-vaapi-driver
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-vaapi-driver
        libvdpau-va-gl
      ];
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/5b45ae49-7f6e-455c-a93b-8b2ea08a158d";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/5514-4051";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/5b45ae49-7f6e-455c-a93b-8b2ea08a158d";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

    "/persist" = {
      device = "/dev/disk/by-uuid/5b45ae49-7f6e-455c-a93b-8b2ea08a158d";
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
