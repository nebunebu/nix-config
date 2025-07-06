{
  # This is required for home-manager's persistence to work
  programs.fuse.userAllowOther = true;

  # Create /persist/home/nebu and set ownership for the user nebu
  # This allows the home-manager persistence module to write to this directory.
  systemd.tmpfiles.rules = [
    "d /persist/home/nebu 0755 nebu users - -"
  ];

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
}
