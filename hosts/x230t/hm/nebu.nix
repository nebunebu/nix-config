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
    packages = [
      inputs.gemini-cli.packages."${pkgs.stdenv.hostPlatform.system}".default
      pkgs.aichat
      pkgs.spotube
      pkgs.freecad
      pkgs.libnotify
      # pkgs.jellyfin-media-player
      pkgs.openpomodoro-cli
      pkgs.calcure
      # pkgs.taskwarrior3
      pkgs.nemo
      inputs.direnv-instant.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };

  news.display = "show";

  desktop = {
    dms.enable = true;
    hyprshot.enable = true;
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bash.enable = true;
    zsh.enable = true;
  };

  # nixpkgs.config = { allowUnfree = true; };
  systemd.user.startServices = "sd-switch";

  neb = {
    services.syncthing.enable = true;
    profile = {
      terminal.enable = true;
    };
  };

  desktop = {
    window-managers = {
      hyprland = {
        enable = true;
        # x230t.enable = true;
        # hyprpicker.enable = true;
      };
    };
  };
}
