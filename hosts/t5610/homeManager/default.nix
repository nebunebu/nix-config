{ inputs, self, ... }:

{
  imports = [
    "${inputs.self}/modules/homeManager"
    ../../../modules/homeManager/development/repopack.nix
  ];

  desktop = {
    browsers = {
      chromium.enable = true;
      firefox.enable = true;
      # zen.enable = true;
    };
    communications = {
      vesktop.enable = true;
    };
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
          # spotube.enable = true;
        };
        # hyprexpo.enable = true;
      };
      swaync.enable = true;
      waybar = {
        t5610.enable = true;
      };
    };
    media = {
      # follow.enable = true;
      mpv.enable = true;
      obs-studio.enable = true;
      sioyek.enable = true;
      spotube.enable = true;
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
      swww.t5610.enable = true;
    };
  };

  development = {
    git.enable = true;
  };

  terminal = {
    bat.enable = true;
    tmux.enable = true;
  };
}
