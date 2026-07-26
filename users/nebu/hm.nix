{
  self,
  ...
}:

{
  imports = [
    "${self}/hm-modules"
  ];

  home = {
    stateVersion = "23.11";
    username = "nebu";
  };

  hm = {
    git.enable = true;
    communications.enable = true;
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
