{
  self,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    ../../../sops
    "${self}/nixos-modules"
    "${self}/users/nebu"
  ];

  services.accounts-daemon.enable = true; # for dms to persist profile

  services = {
    gvfs.enable = true;
    # NOTE: required for spotube
    gnome.at-spi2-core.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  environment.systemPackages = [
    # TODO: move this to its own modules
    pkgs.qbittorrent
    pkgs.calibre
    # https://flozz.github.io/rivalcfg/devices/rival3.html
    pkgs.rivalcfg
  ];

  nos = {
    boot.enable = true;
    console.enable = true;
    system.enable = true;
    thunar.enable = true;
    nix.enable = true;
    networking.enable = true;
    udisks2.enable = true;
    sops = {
      enable = true;
      gpg = {
        enable = true;
      };
      pass.enable = true;
    };
    obs.enable = true;
    stylix.enable = true;
    users.nebu.enable = true;
    desktop = {
      hyprland.enable = true;
      pipewire.enable = true;
    };

    virtualisation = {
      virt-manager.enable = true;
    };
  };

  programs.zsh.enable = true;

  networking = {
    hostName = "antillia";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 3000 ];
    };
  };

  boot = {
    supportedFilesystems = [ "fuse" ];
    kernelParams = [
      "raid=noautodetect"
      "quiet"
      "plymouth.enable-quit-progress=1"
    ];
    extraModprobeConfig = ''
      options hid_apple fnmode=1
    '';
  };
}
