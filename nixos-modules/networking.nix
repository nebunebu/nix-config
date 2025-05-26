{
  # networking.wireless.enable = true;
  networking.networkmanager =  {
    enable = true;
  };
  programs = {
    zsh.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
