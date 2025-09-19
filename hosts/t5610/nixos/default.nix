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
    ./builder.nix
  ];

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
  # programs.river.enable = false;

  # sops.enable = true;
  neb = {
    udisks2.enable = true;
    sops = {
      enable = true;
      # taskwarrior.enable = true;
      gpg = {
        enable = true;
      };
      pass.enable = true;
    };
    # pinchflat.enable = true;
    obs.enable = true;
    beaverhabits.enable = true;
    dumbkan.enable = true;
    freshrss.enable = false;
    glance.enable = true;
    jellyfin.enable = false;
    linkding.enable = true;
    ollama.enable = true;
    stylix.enable = true;
    # taskchampion.enable = true;
    desktop = {
      sddm.enable = true;
      hyprland.enable = true;
      pipewire.enable = true;
    };

    virtualisation = {
      virt-manager.enable = true;
    };
  };

  networking = {
    hostName = "t5610";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 3000 ];
    };
  };

  environment = {
    sessionVariables = {
      HOSTNAME = "t5610";
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
