{ inputs, pkgs, unstablePkgs, lib, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./awscli.nix
    ./bat.nix
    ./chromium
    ./cli-tools.nix
    ./direnv.nix
    ./firefox
    ./fuzzel
    ./fzf.nix
    ./git.nix
    ./hyprland
    ./kitty.nix
    ./lf.nix
    ./mpv.nix
    ./mpv.nix
    ./newsboat
    ./nix-tools.nix
    ./password-store.nix
    ./sioyek.nix
    ./swww.nix
    ./syncthing.nix
    ./taskwarrior.nix
    ./theme.nix
    ./tmux.nix
    ./wallpapers
    ./waybar
    ./webcord.nix
    ./yazi.nix
    ./zsh
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  home = {
    stateVersion = "23.11";
    username = "nebu";
    homeDirectory = lib.mkForce "/home/nebu";
    packages = [
      unstablePkgs.element-desktop-wayland
      pkgs.pavucontrol
      pkgs.libnotify
      # krita
      # gimp
      # thunderbird
      # fd
      # bottom
      # ffmpeg
      # distrobox
      pkgs.lazygit
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

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    zsh.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
