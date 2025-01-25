{ self
, pkgs
, unstablePkgs
, ...
}:

{
  imports = [ "${self}/hm-modules" ];

  home.packages = [
    unstablePkgs.aichat
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
    };

    profile = {
      desktop = {
        enable = true;
        # NOTE: not sure how I want to handle this
        # x230t.enable = true;
      };
      development.enable = true;
      terminal.enable = true;
      # NOTE: not set up
      # tablet.enable = false;
    };
  };
}
