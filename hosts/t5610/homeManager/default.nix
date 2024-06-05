{ config, ... }:
{
  imports = [
    ../../../modules/homeManager
  ];

  app = {
    git.enable = true;
    kitty.enable = true;
    sioyek.enable = true;
    waybar.t5610.enable = true;
    hyprland = {
      enable = true;
      t5610.enable = true;
    };
    tmux.enable = true;
    # theme.enable = true;
  };

  programs.swww = {
    hyprlandIntegration.enable = true;
    enable = true;
    monitors = {
      "DP-1".wallpaper = "${config.xdg.configHome}/wallpapers/liminal-tv.jpg";
      "DP-2".wallpaper = "${config.xdg.configHome}/wallpapers/liminal-hall.jpg";
    };
  };
}
