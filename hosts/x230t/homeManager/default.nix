{ inputs, pkgs, config, ... }:

{
  imports = [
    ../../../modules/homeManagerModules
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  app = {
    git.enable = true;
    kitty.enable = true;
    sioyek.enable = true;
    tmux.enable = true;
    zsh.enable = true;
    theme.enable = true;
    waybar.x230t.enable = true;
    hyprland = {
      enable = true;
      x230t.enable = true;
    };
  };

  programs.swww = {
    hyprlandIntegration.enable = true;
    enable = true;
    monitors = let
      wp = "${config.home.homeDirectory}/.nix-config/modules/homeManagerModules/wallpapers/";
      w1 = "wallhaven-d6vm2l.jpg";
      w2 = "wallhaven-exvprr.jpg";
      w3 = "wallhaven-qzpv5q.jpg";
    in {
      "DP-1".wallpaper = "${wp}/${w2}";
    };
  };

  # programs.nix-index = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };


  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
      firefox
      pavucontrol
      # krita
      # gimp
      # thunderbird
      # fd
      # bottom
      # ffmpeg
      # distrobox
      # lazygit
      # libnotify
      # invidtui
      # noto-fonts
      (nerdfonts.override {
        fonts = [
          "DroidSansMono"
          "JetBrainsMono"
          "HeavyData"
        ];
      })
    ];
  };

  programs.home-manager.enable = true;
  programs.bash.enable = true;
  programs.zsh.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
