{ self
, pkgs
, unstablePkgs
, ...
}:

{
  imports = [ "${self}/hm-modules" ];

  home.packages = [
    unstablePkgs.aichat
    pkgs.foot
    pkgs.libnotify
    pkgs.jellyfin-media-player
  ];

  neb = {

    # security = {
    #   sops.enable = true;
    #   gpg = {
    #     enable = true;
    #     host = "x230t";
    #   };
    # };

    services.syncthing.enable = true;
    desktop = {
      # ui.astal.x230t.enable = true;
      ui.hyprpanel.x230t.enable = true;
      window-managers.hyprland = {
        enable = true;
        x230t.enable = true;
        hyprpaper.x230t.enable = true;
        hyprpicker.enable = true;
        pyprland = {
          enable = true;
          # btm.enable = true;
          spotube.enable = true;
        };
      };


      browsers = {
        chromium.enable = true;
        firefox.enable = true;
      };

      communications = {
        vesktop.enable = true;
      };

      media = {
        # follow.enable = true;
        mpv.enable = true;
        obs-studio.enable = true;
        sioyek.enable = true;
        spotube.enable = true;
        glance.enable = true;
        # xournalpp.enable = true;
      };

      productivity = {
        obsidian.enable = true;
        # taskwarrior = {
        #   enable = true;
        #   recurrence.disable = true;
        # };
      };

      utilities = {
        fuzzel.enable = true;
        # kitty.enable = true;
        ghostty.enable = true;
        pavucontrol.enable = true;
      };
    };

    development = {
      git.enable = true;
      repomix.enable = true;
    };

    terminal = {
      shell = {
        fzf.enable = true;
        tmux.enable = true;
        zsh.enable = true;
      };
      file-navigation = {
        lf.enable = true;
        yazi.enable = true;
      };
      media = {
        buku.enable = true;
        newsboat.enable = true;
      };
      utilities.profile.enable = true;
    };
  };
}
