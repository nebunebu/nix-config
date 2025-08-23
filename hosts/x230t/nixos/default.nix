{
  self,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    "${self}/nixos-modules"
    ../../../sops
    ./hardware-configuration.nix
    # ./nextcloud.nix
  ];

  services = {
    gvfs.enable = true;
    upower.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.brlaser ];
    };
    ipp-usb.enable = true;
  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
  };

  programs.thunar = {
    enable = true;
    plugins = [
      pkgs.xfce.thunar-archive-plugin
      pkgs.xfce.thunar-volman
      pkgs.xfce.thunar-media-tags-plugin
      pkgs.xfce.thunar-vcs-plugin
    ];
  };

  neb = {
    desktop = {
      hyprland.enable = true;
      pipewire.enable = true;
      sddm.enable = true;
    };
    obs.enable = true;
    stylix.enable = true;
    udisks2.enable = true;
  };

  networking.hostName = "x230t";
  environment = {
    sessionVariables = {
      HOSTNAME = "x230t";
    };
  };

  users.users = {
    nebu = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "lp"
        "scanner"
      ];
    };
    acgp = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "lp"
        "scanner"
      ];
    };
  };
}
