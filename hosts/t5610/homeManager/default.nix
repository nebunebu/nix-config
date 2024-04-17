{ inputs, pkgs, unstablePkgs, config, ... }:

{
  imports = [
    ../../../modules/homeManagerModules
    # ./impermanence/homeManager.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  app = {
    git.enable = true;
    kitty.enable = true;
    sioyek.enable = true;
    waybar.t5610.enable = true;
    hyprland = {
      enable = true;
      t5610.enable = true;
    };

    tmux.enable = true;
    zsh.enable = true;
    theme.enable = true;
  };

  programs.swww = {
    hyprlandIntegration.enable = true;
    enable = true;
    monitors =
      let
        wp = "${config.home.homeDirectory}/.nix-config/modules/homeManagerModules/wallpapers/";
        w1 = "wallhaven-d6vm2l.jpg";
        w2 = "wallhaven-exvprr.jpg";
        w3 = "wallhaven-qzpv5q.jpg";
      in
      {
        "DP-1" = {
          wallpaper = "${wp}/${w3}";
        };
        "DP-2" = {
          wallpaper = "${wp}/${w1}";
        };
      };
  };

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = builtins.attrValues
      {
        inherit (pkgs)
          firefox
          pavucontrol
          ;
      } ++ [
      (pkgs.nerdfonts.override {
        fonts = [
          "DroidSansMono"
          "JetBrainsMono"
          "HeavyData"
        ];
      })
    ];

    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    zsh.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
