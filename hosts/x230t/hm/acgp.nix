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
      inputs.gemini-cli.packages."${pkgs.system}".default
      pkgs.aichat
      pkgs.libnotify
      pkgs.openpomodoro-cli
      pkgs.calcure
      pkgs.taskwarrior
    ];
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bash.enable = true;
    zsh.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  neb = {
    profile = {
      desktop = {
        enable = true;
      };
      development.enable = true;
      terminal.enable = true;
    };

    desktop = {
      window-managers = {
        hyprland = {
          enable = true;
          x230t.enable = true;
          hyprpaper.x230t.enable = true;
          hyprpicker.enable = true;
          pyprland = {
            enable = true;
          };
        };
      };
    };
  };
}
