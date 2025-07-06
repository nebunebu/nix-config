{ pkgs, ... }:
{
  # This is required for home-manager's persistence to work
  programs.fuse.userAllowOther = true;

  # Add system-level persistence using the impermanence module
  environment.persistence."/persist" = {
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/NetworkManager"
      "/var/lib/bluetooth"
    ];
    files = [
      "/etc/machine-id"
    ];
  };

  # ensure /persist is mounted before user activation script is run and directories are created
  fileSystems."/persist".neededForBoot = true;

  systemd.services.wipe-root = {
    description = "Wipe root subvolume on shutdown";
    wantedBy = [ "shutdown.target" ];
    before = [
      "shutdown.target"
      "reboot.target"
      "halt.target"
    ];
    conflicts = [
      "shutdown.target"
      "reboot.target"
      "halt.target"
    ];
    unitConfig = {
      DefaultDependencies = "no";
    };
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStart = "/bin/true";
      ExecStop = pkgs.writeShellScript "wipe-root" ''
        set -e

        # Mount the btrfs root filesystem (subvolid=5 is the root of all subvolumes)
        mkdir -p /tmp/btrfs-root
        mount -t btrfs -o subvolid=5 /dev/nvme0n1p2 /tmp/btrfs-root

        # Delete the root subvolume if it exists
        if [ -d /tmp/btrfs-root/@ ]; then
          echo "Deleting root subvolume @..."
          btrfs subvolume delete /tmp/btrfs-root/@
        fi

        # Recreate the root subvolume
        echo "Creating new root subvolume @..."
        btrfs subvolume create /tmp/btrfs-root/@

        # Unmount
        umount /tmp/btrfs-root
        rmdir /tmp/btrfs-root

        echo "Root subvolume wiped successfully"
      '';
      TimeoutStopSec = "30s";
    };
  };
}
