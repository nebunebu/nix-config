{ inputs, pkgs, unstablePkgs, config, ... }:

{
  imports = [
    ../../../modules/homeManagerModules
    # ./impermanence/homeManager.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  app.git.enable = true;
  app.kitty.enable = true;
  app.sioyek.enable = true;

  app.waybar.t5610.enable = true;

  app.hyprland = {
    enable = true;
    t5610.enable = true;
  };

  app.tmux.enable = true;
  app.zsh.enable = true;
  app.theme.enable = true;

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
    packages = with pkgs; [
      tree
      firefox
      pavucontrol
      nitch
      ripgrep-all
      # krita
      # gimp
      # thunderbird
      # nix-output-monitor
      # nixpkgs-fmt
      # nurl
      # comma
      # statix
      # nix-search-cli
      # nix-prefetch-github
      # fd
      # bottom
      # ripgrep
      # ripgrep-all
      # ffmpeg
      # yt-dlp
      # jq
      # distrobox
      # pup
      # lazygit
      # nitch
      #
      # libnotify
      # tree
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
