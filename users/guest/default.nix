{ pkgs, lib, ... }:
{
  users = {
    mutableUsers = false;
    users.guest = {
      isNormalUser = true;
      description = "Guest SSH user for installer ISO";
      initialPassword = "enter";
      shell = pkgs.bashInteractive;
      extraGroups = [
        "wheel"
      ];
    };
  };

  services.openssh.settings = {
    PasswordAuthentication = lib.mkDefault true;
    PermitRootLogin = lib.mkForce "no";
  };
}
