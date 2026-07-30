{
  disko.devices.disk.main = {
    # Set by install.sh before running disko; see install.sh.
    device = "/dev/disk/by-id/CHANGE_ME";
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
