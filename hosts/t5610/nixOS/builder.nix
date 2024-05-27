{

  users.users.nixremote = {
    name = "builder";
    createHome = true;
    group = "users";
    shell = "/bin/sh";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDohUrV/Gdhdzdz6GAc9aZqZWngsU02ERzENYFQSzO9A root@x230t"
    ];
  };

  security.sudo.extraRules = [
    {
      users = [ "nixremote" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/nix-store";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

}
