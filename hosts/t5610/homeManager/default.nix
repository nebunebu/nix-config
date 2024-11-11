{ inputs, pkgs, ... }:

{
  imports = [
    "${inputs.self}/modules/homeManager"
    ../../../modules/homeManager/development/repopack.nix
  ];

  home.packages = [
    (pkgs.writeShellApplication {
      name = "roseify";
      runtimeInputs = [ pkgs.lutgen ];
      text = /* sh */ ''
        lutgen apply "$1" -o "roseified-$1" -p rose-pine
      '';
    })
  ];


  # gtk = pkgs.lib.mkForce {
  #   enable = true;
  #   theme = {
  #     package = pkgs.rose-pine-gtk-theme;
  #     name = "rose-pine-theme";
  #   };
  #   iconTheme = {
  #     package = pkgs.rose-pine-icon-theme;
  #     name = "rose-pine-icon-theme";
  #   };
  # };

  desktop = {
    core = {
      hyprland = {
        enable = true;
        t5610.enable = true;
        pyprland = {
          enable = true;
          btm.enable = true;
          claude.enable = true;
          hmOptions.enable = true;
          nixpkgs.enable = true;
          noogle.enable = true;
          obsidian.enable = true;
          spotube.enable = true;
        };
        # hyprexpo.enable = true;
      };
      # swaync.enable = false;
      # waybar = {
      #   t5610.enable = false;
      # };
    };
  };

  neb = {
    development = {
      git.enable = true;
    };

    terminal = {
      core = {
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
      productivity = {
        taskwarrior.enable = true;
      };
      utilities = {
        bat.enable = true;
        cli-tools.enable = true;
        nix-tools.enable = true;
      };
    };

    desktop = {
      core = {
        hyprland.hyprpaper.t5610.enable = true;
        astal.t5610.enable = true;
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
        # pomodoro-logger = true;
        # super-productivity = true;
      };

      utilities = {
        fuzzel.enable = true;
        kitty.enable = true;
        pavucontrol.enable = true;
        # swww.t5610.enable = false;
      };
    };
  };
}
