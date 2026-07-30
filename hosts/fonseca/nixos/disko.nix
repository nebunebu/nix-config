{
  disko.devices.disk.main = {
    # Must match DISK_ID in install.sh, which verifies it before wiping anything.
    device = "/dev/disk/by-id/nvme-INTEL_SSDPEKKF256G8L_BTHH82340X2N256B";
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          size = "512M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [
              "fmask=0022"
              "dmask=0022"
            ];
          };
        };
        root = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            subvolumes = {
              "/root" = {
                mountpoint = "/";
              };
              "/nix" = {
                mountpoint = "/nix";
              };
              "/persist" = {
                mountpoint = "/persist";
              };
            };
          };
        };
      };
    };
  };
}
