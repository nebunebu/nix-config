{ inputs
, pkgs
, outputs
, ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./prism
  ];

  # programs.thunderbird.enable = true;

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
  };

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
      krita
      gimp
      thunderbird
      tree
      nix-output-monitor
      nixpkgs-fmt
      nurl
      comma
      statix
      nix-search-cli
      nix-prefetch-github
      fd
      bottom
      ripgrep
      ripgrep-all
      ffmpeg
      yt-dlp
      jq
      distrobox
      pup
      lazygit
      nitch

      libnotify
      tree
      invidtui
      noto-fonts
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
