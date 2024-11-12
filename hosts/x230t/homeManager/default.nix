{ self
, ...
}:

{
  imports = [ "${self}/hm-modules" ];

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
      core.hyprland.hyprpaper.x230t.enable = true;
      core.astal.x230t.enable = true;

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
        # spotube.enable = true;
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
        # swww.x230t.enable = false;
      };
    };
  };



  desktop = {
    core = {
      hyprland = {
        enable = true;
        x230t.enable = true;
        # pyprland = {
        #   enable = false;
        #   btm.enable = true;
        #   claude.enable = true;
        #   hmOptions.enable = true;
        #   nixpkgs.enable = true;
        #   noogle.enable = true;
        #   obsidian.enable = true;
        #   spotube.enable = true;
        # };
        # hyprexpo.enable = true;
      };
      # swaync.enable = false;
      # waybar = {
      #   x230t.enable = false;
      # };
    };
  };


}
