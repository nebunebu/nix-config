{ inputs, pkgs, config, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  environment.systemPackages = [ pkgs.sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/nebu/.config/sops/age/keys.txt";
    secrets.nebu-password.neededForUsers = true;
  };

  users.users.nebu = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.nebu-password.path;
  };
}
