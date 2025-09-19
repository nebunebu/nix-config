{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        libvdpau-va-gl
        mesa.drivers
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-vaapi-driver
        libvdpau-va-gl
        mesa.drivers
      ];
    };
  };

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
