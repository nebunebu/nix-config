{ config, ... }:

{
  imports = [
    ../../../modules/homeManager
  ];

  app = {
    git.enable = true;
    kitty.enable = true;
    sioyek.enable = true;
    tmux.enable = true;
    theme.enable = true;
    waybar.x230t.enable = true;
    hyprland = {
      enable = true;
      x230t.enable = true;
    };
  };

  programs.swww = {
    hyprlandIntegration.enable = true;
    enable = true;
    monitors."DP-1".wallpaper = "${config.xdg.configHome}/wallpapers/liminal-tv.jpg";
  };
}
