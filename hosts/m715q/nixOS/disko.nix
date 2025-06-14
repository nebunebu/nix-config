{
  disko.devices = {
    disk = {
      nvme = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            EFI = {
              name = "EFI";
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            ROOT = {
              name = "ROOT";
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Use with caution, this will format the partition
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                ];
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                  };
                  "@persist" = {
                    mountpoint = "/persist";
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                  };
                  "@snapshots" = {
                    mountpoint = "/.snapshots";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
