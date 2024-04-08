{ inputs, pkgs, unstablePkgs, ... }:

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
  app.hyprland.enable = true;
  app.tmux.enable = true;
  app.zsh.enable = true;
  app.theme.enable = true;

  # programs.nix-index = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };


  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
      unstablePkgs.webcord
      tree
      firefox
      pavucontrol
      nitch
      ripgrep-all
      waybar
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
