{ inputs, pkgs, unstablePkgs, config, ... }:

{
  imports = [
    ../../modules/homeManagerModules
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

  # FIX: rewrite with enable
  # programs.swww = [
  #   {
  #     monitor = "DP-1";
  #     # wallpaper = "${config.xdg.configHome}/wallpapers/wallhaven-3lerw3.jpg";
  #     # wallpaper = "/home/nebu/.config/wallpapers/wallhaven-3lerw3.jpg";
  #     wallpaper = "/home/nebu/.nix-config/modules/homeManagerModules/wallpapers/wps/wallhaven-3lerw3.jpg";
  #   }
  #   {
  #     monitor = "DP-2";
  #     wallpaper = "${config.xdg.configHome}/wallpapers/wallhaven-vqr50p.jpg";
  #   }
  # ];

  # programs.nix-index = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };


  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
      tree
      firefox
      pavucontrol
      nitch
      ripgrep-all

      swww
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
