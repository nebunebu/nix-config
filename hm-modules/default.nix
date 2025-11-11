{
  imports = [
    ./hyprshot.nix
    # ./terminal
    ./xdg.nix
    ./syncthing.nix
    ./sops.nix
    ./dms.nix

    ./terminal-emulators
    ./web-browsers
    ./window-managers
    ./communications

    ./mpv.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./sioyek.nix

    ./awscli.nix
    ./claude-code.nix
    ./fzf.nix
    ./git.nix
    ./go.nix
    ./starship.nix
    ./tmux.nix
    ./shells/zsh

    # ./aichat
    # ./bat.nix
    # ./bottom.nix
    # ./cava.nix
    # ./cli-tools.nix
    # ./direnv.nix
    # ./eza.nix
    # ./fastfetch.nix
    # ./fd.nix
    # ./jq.nix
    # ./lazygit.nix
    # ./manix.nix
    # ./nh.nix
    # ./nix-index.nix
    # ./nix-tools.nix
    # ./ripgrep.nix
    # ./tealdeer.nix
    # ./yazi.nix
    # ./yt-dlp.nix
    # ./zoxide.nix
  ];

  desktop = {
    communications = {
      vesktop.enable = true;
      thunderbird.enable = true;
    };
    media = {
      sioyek.enable = true;
      mpv.enable = true;
      obs-studio.enable = true;
    };
    pavucontrol.enable = true;
    terminal-emulators = {
      foot.enable = true;
      ghostty.enable = true;
      kitty.enable = true;
    };
    web-browsers = {
      chromium.enable = true;
      firefox.enable = true;
      firefoxpwa.enable = true;
    };
  };

  development = {
    awscli.enable = false;
    claude-code.enable = true;
    git.enable = true;
    go.enable = true;
  };
}
