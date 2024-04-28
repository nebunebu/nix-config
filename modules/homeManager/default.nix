{ inputs, pkgs, unstablePkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./awscli.nix
    ./bat.nix
    ./lf.nix
    ./mpv.nix
    ./fzf.nix
    ./newsboat
    ./firefox
    ./git.nix
    ./kitty.nix
    ./hyprland
    ./sioyek.nix
    ./mpv.nix
    ./tmux.nix
    ./zsh.nix
    ./theme.nix
    ./taskwarrior.nix
    ./waybar
    ./fuzzel
    ./webcord.nix
    ./swww.nix
    ./nix-tools.nix
    ./cli-tools.nix
    ./chromium
    ./direnv.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = [
      unstablePkgs.element-desktop-wayland
      pkgs.manix
      pkgs.pavucontrol
      pkgs.libnotify
      # krita
      # gimp
      # thunderbird
      # fd
      # bottom
      # ffmpeg
      # distrobox
      # lazygit
      # invidtui
      # noto-fonts
      (pkgs.nerdfonts.override {
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
