{ pkgs, config, ... }:

{

  users.users.nebu = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPasswordFile = config.sops.secrets.nebu-password.path;
  };
}
