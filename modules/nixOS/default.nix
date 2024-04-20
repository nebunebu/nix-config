{
  imports = [
    ./users
    ./nixvim
    # ./discord.nix
    ./doas.nix
    ./nix.nix
    ./sops.nix
    ./sddm.nix
    ./hyprland.nix
    ./virtualisation
    ./tuir.nix
  ];

  networking.wireless.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "US/Eastern";
  services = {
    openssh.enable = true;
    xserver = {
      layout = "us";
      xkbOptions = "caps:swapescape";
    };
  };
  console = {
    useXkbConfig = true;
    font = "Lat2-Terminus16";
    # keyMap = "us";
  };

  programs = {
    zsh.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  system.stateVersion = "23.11";
}
