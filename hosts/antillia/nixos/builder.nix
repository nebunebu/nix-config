{
  users.users.builder = {
    name = "builder";
    createHome = true;
    group = "users";
    shell = "/bin/sh";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINS3YPeqVRXwWEGzFCBZcabEiwaETgCQ/91es0CQCM1E builder@t5610"
    ];
  };

  nix.settings.trusted-users = [ "builder" ];

  security.sudo.extraRules = [
    {
      users = [ "builder" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/nix-store";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
