{
  imports = [
    ./ai/claude-code.nix
    ./ai/aichat

    ./communications

    ./fs-tools/bat.nix
    ./fs-tools/eza.nix
    ./fs-tools/fd.nix
    ./fs-tools/lf.nix
    ./fs-tools/ripgrep.nix
    ./fs-tools/yazi.nix
    ./fs-tools/zoxide.nix

    ./nix-tools/manix.nix
    ./nix-tools/nh.nix
    ./nix-tools/nix-index.nix
    ./nix-tools/nix-inspect.nix
    ./nix-tools/nixpkgs-fmt.nix
    ./nix-tools/nurl.nix
    ./nix-tools/nvd.nix
    ./nix-tools/statix.nix
    ./nix-tools/vimPluginsUpdater.nix
    # add ./nix-tools/nixpkgs-hammering.nix
    # add ./nix-tools/nix-alien.nix
    # add ./nix-tools/deadnix.nix

    ./shells/zsh
    ./shells/starship.nix

    ./terminal-emulators

    ./web-browsers

    ./window-managers

    ./awscli.nix
    ./bottom.nix
    ./buku.nix
    ./caligula.nix
    ./cava.nix
    ./direnv.nix
    ./dms.nix
    ./fastfetch.nix
    ./fzf.nix
    ./git.nix
    ./go.nix
    ./hyprshot.nix
    ./jq.nix
    ./lazygit.nix
    ./mpv.nix
    ./newsboat.nix
    ./obs-studio.nix
    ./pavucontrol.nix
    ./pup.nix
    ./pyradio.nix
    ./sioyek.nix
    ./sops.nix # not wrapped with option
    ./syncthing.nix
    ./tealdeer.nix
    ./tmux.nix
    ./tuir.nix
    ./usbutils.nix
    ./wvkbd.nix
    ./xdg.nix # not wrapped with option
    ./yt-dlp.nix
  ];

  desktop = {
    communications = {
      vesktop.enable = true;
      thunderbird.enable = true;
    };
    dms.enable = true;
    hyprshot.enable = true;
    media = {
      mpv.enable = true;
      obs-studio.enable = true;
      sioyek.enable = true;
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
    window-managers = {
      hyprland.enable = true;
    };
  };

  utilities = {
    caligula.enable = true;
  };

  development = {
    # awscli.enable = true;
    claude-code.enable = true;
    git.enable = true;
    go.enable = true;
  };

  tablet = {
    wvkbd.enable = true;
  };

  neb = {
    services.syncthing.enable = true;
    desktop = {
      window-managers = {
        hyprland = {
          x230t.enable = true;
          # t5610.enable = true;
          # hyprpicker.enable = true;
          # hyprgrass.enable = true;
          # pyprland.enable = true;
          # hyprpolkitagent.enable = true;
        };
      };
    };
    terminal = {
      shell = {
        starship.enable = true;
        zsh.enable = true;
        tmux.enable = true;
        fzf.enable = true;
      };
      media = {
        newsboat.enable = true;
        pyradio.enable = true;
        tuir.enable = true;
      };
      utilities = {
        # buku.enable = true;
        aichat.enable = true;
        bat.enable = true;
        bottom.enable = true;
        cava.enable = true;
        direnv.enable = true;
        eza.enable = true;
        fastfetch.enable = true;
        fd.enable = true;
        jq.enable = true;
        lazygit.enable = true;
        # lf.enable = true;
        manix.enable = true;
        nh.enable = true;
        nix-index.enable = true;
        nix-inspect.enable = true;
        nixpkgs-fmt.enable = true;
        nurl.enable = true;
        nvd.enable = true;
        pup.enable = true;
        ripgrep.enable = true;
        statix.enable = true;
        tealdeer.enable = true;
        usbutils.enable = true;
        vimPluginsUpdater.enable = true;
        yazi.enable = true;
        yt-dlp.enable = true;
        zoxide.enable = true;
      };
    };
  };
}
