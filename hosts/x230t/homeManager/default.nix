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
    services.syncthing.enable = true;
    profile = {
      desktop = {
        enable = true;
      };
      development.enable = true;
      terminal.enable = true;
      # tablet.enable = false;
    };

    # NOTE: not sure what I want to do with this
    desktop = {
      # astal.x230t.enable = true;
      hyprpanel.x230t.enable = true;

      window-managers = {
        hyprland = {
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
      };
    };
  };
}
