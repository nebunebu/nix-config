{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixOS
    inputs.home-manager.nixosModules.default
  ];

  users.users.nixremote = {
    name = "nixremote";
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

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  nixpkgs.config.allowUnfree = true;

  sops.enable = true;
  tuir.enable = true;

  app.virt-manager.enable = true;
  networking.hostName = "t5610";
  environment = {
    sessionVariables = {
      HOSTNAME = "t5610";
    };
    etc."machine-id" = {
      text = "4d1db5f3ed1d4094993faef0f4926a74";
      mode = "0444";
    };
  };

  desktop.hyprland.enable = true;
}
