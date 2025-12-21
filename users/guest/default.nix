{ pkgs, lib, ... }:
{
  users = {
    mutableUsers = false;
    users.guest = {
      isNormalUser = true;
      description = "Guest SSH user for installer ISO";
      initialPassword = "enter";
      shell = pkgs.bashInteractive;
    };
  };

  services.openssh.settings = {
    PasswordAuthentication = lib.mkDefault true;
    # Override installation profile default to keep root SSH login disabled on the ISO.
    PermitRootLogin = lib.mkForce "no";
  };
}
