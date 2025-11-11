{
  inputs,
  self,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    "${self}/hm-modules"
  ];

  home = {
    stateVersion = "23.11";
    username = "nebu";
    homeDirectory = lib.mkForce "/home/nebu";
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bash.enable = true;
    zsh.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
