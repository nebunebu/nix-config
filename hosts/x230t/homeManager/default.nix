{ self
, pkgs
, ...
}:

{
  imports = [ "${self}/hm-modules" ];

  home.packages = [ pkgs.foot pkgs.libnotify ];

  neb = {

    security = {
      sops.enable = true;
      gpg = {
        enable = true;
        host = "x230t";
      };
    };

    desktop = {
      ui.astal.x230t.enable = true;
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
        # zen.enable = true;
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
        kitty.enable = true;
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
      utilities = {
        bat.enable = true;
        cli-tools.enable = true;
        nix-tools.enable = true;
      };
    };
  };
}
