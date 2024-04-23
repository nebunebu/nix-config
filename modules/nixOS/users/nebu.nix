{ pkgs, config, ... }:

{

  sops.secrets.nebu-password.neededForUsers = true;

  users.users.nebu = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    # hashedPasswordFile = config.sops.secrets.test-password.path;
  };
}
