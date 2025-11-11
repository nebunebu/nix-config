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
    username = "acgp";
    homeDirectory = lib.mkForce "/home/acgp";
    packages = [
      inputs.gemini-cli.packages."${pkgs.stdenv.hostPlatform.system}".default
      pkgs.aichat
      pkgs.libnotify
      pkgs.openpomodoro-cli
      # pkgs.calcure
      # pkgs.taskwarrior3
      pkgs.cowsay
      pkgs.libreoffice
      pkgs.gimp3-with-plugins
      pkgs.stripe-cli
      pkgs.hledger
      pkgs.krita
      # pkgs.drawio
    ];
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bash.enable = true;
    zsh.enable = true;
    abook.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  neb = {
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
        # pyprland = {
        #   enable = true;
        # };
      };
    };
  };
}
