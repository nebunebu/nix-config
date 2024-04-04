{ inputs
, pkgs
, ...
}: {

  imports = [
    ../../modules/homeManagerModules
    # inputs.nix-colors.homeManagerModules.default
  ];

  app.git.enable = true;
  app.kitty.enable = true;
  app.sioyek.enable = true;
  app.hyprland.enable = true;
  app.tmux.enable = true;
  app.zsh.enable = true;

  # programs.nix-index = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  # colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

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
