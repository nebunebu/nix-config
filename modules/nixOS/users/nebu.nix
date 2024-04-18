{ pkgs, ... }:

{

  users.users.nebu = {
    isNormalUser = true;
    initialPassword = "password";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
}
