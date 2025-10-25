{
  # networking.wireless.enable = true;
  networking.networkmanager = {
    enable = false;
  };
  systemd.network = {
    enable = true;
    wait-online.anyInterface = true;
    networks = {
      # Configure your ethernet interface
      "10-enp1s0f0" = {
        matchConfig.Name = "enp1s0f0";
        networkConfig = {
          DHCP = "yes";
          DNS = [
            "1.1.1.1"
            "8.8.8.8"
          ]; # Fallback DNS
        };
        dhcpV4Config = {
          UseDNS = true;
          RouteMetric = 100;
        };
      };
    };
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
