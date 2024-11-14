{ inputs, pkgs, lib, config, ... }:

{
  imports = [
    "${inputs.self}/hm-modules"
    # ../../../modules/homeManager/development/repopack.nix
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

  # NOTE: Tmp fix for hyprland error stylix causes by setting "col.shadow"
  wayland.windowManager.hyprland.settings = {
    decoration = lib.mkForce (lib.filterAttrs
      (name: _: name != "col.shadow")
      (config.stylix.targets.hyprland.settings.decoration or { })
    );
    # shadow = {
    #   enabled = true;
    #   range = 4;
    #   render_power = 3;
    #   color = "rgba(1a1a1aee)";
    # };
  };


  # desktop = {
  #   core = {
  #     hyprland = {
  #       enable = false;
  #       t5610.enable = true;
  #       pyprland = {
  #         enable = true;
  #         btm.enable = true;
  #         claude.enable = true;
  #         hmOptions.enable = true;
  #         nixpkgs.enable = true;
  #         noogle.enable = true;
  #         obsidian.enable = true;
  #         spotube.enable = true;
  #       };
  #       hyprexpo.enable = true;
  #     };
  #     swaync.enable = false;
  #     waybar = {
  #       t5610.enable = false;
  #     };
  #   };
  # };


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
      window-managers.hyprland.enable = true;
      # core = {
      #   hyprland.hyprpaper.t5610.enable = true;
      #   astal.t5610.enable = true;
      # };

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
