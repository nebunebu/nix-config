{ self
, inputs
, pkgs
, ...
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
  };

  environment.systemPackages = [
    # TODO: move this to its own modules
    pkgs.qbittorrent
    pkgs.calibre
    # https://flozz.github.io/rivalcfg/devices/rival3.html
    pkgs.rivalcfg
    # (pkgs.callPackage ../../../pkgs/super-productivity.nix { })
    pkgs.foot
  ];
  programs.river.enable = true;

  # sops.enable = true;
  # tuir.enable = true;
  neb = {
    sops = {
      enable = true;
      taskwarrior.enable = true;
      tuir.enable = true;
      gpg = {
        enable = true;
      };
      pass.enable = true;
    };
    # pinchflat.enable = true;
    amdgpu.enable = true;
    anki-sync.enable = true;
    beaverhabits.enable = true;
    freshrss.enable = true;
    jellyfin.enable = true;
    ollama.enable = true;
    stylix.enable = true;
    taskchampion.enable = true;
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
    etc."machine-id" = {
      text = "4d1db5f3ed1d4094993faef0f4926a74";
      mode = "0444";
    };
  };

  boot = {
    supportedFilesystems = [ "fuse" ];
    kernelParams = [
      "raid=noautodetect"
      "quiet"
      "plymouth.enable-quit-progress=1"
      "video=DP-1:1920x1080@60"
      "video=HDMI-A-1:1920x1080@60"
      "tsc=reliable"
    ];
    extraModprobeConfig = ''
      options hid_apple fnmode=1
    '';
  };
}
