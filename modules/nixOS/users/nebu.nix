{ pkgs, config, ... }:

{

  sops.secrets.nebu-password.neededForUsers = true;

  users = {
    mutableUsers = false;
    users.nebu = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      hashedPasswordFile = config.sops.secrets.nebu-password.path;
    };
  };
}
