{
  inputs,
  self,
  pkgs,
  ...
}:

{
  imports = [ "${self}/hm-modules" ];

  home.packages = [
    inputs.gemini-cli.packages."${pkgs.system}".default
    pkgs.aichat
    pkgs.libnotify
    pkgs.jellyfin-media-player
    pkgs.openpomodoro-cli
    pkgs.calcure
    pkgs.taskwarrior
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
      window-managers = {
        hyprland = {
          enable = true;
          x230t.enable = true;
          hyprpaper.x230t.enable = true;
          hyprpicker.enable = true;
          pyprland = {
            enable = true;
          };
        };
      };
    };
  };
}
