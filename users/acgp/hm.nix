{
  lib,
  ...
}:

{
  imports = [
    # NOTE: needs `self` back in the argument set to re-enable
    # "${self}/hm-modules"
  ];

  home = {
    stateVersion = "23.11";
    username = "acgp";
    homeDirectory = lib.mkForce "/home/acgp";
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
