{ self, inputs, pkgs, ... }:

{
  imports = [
    "${self}/modules/homeManager"
    "${self}/custom/homeManager"
  ];

  home.packages = [ pkgs.swww ];

  app = {
    git.enable = true;
    kitty.enable = true;
    sioyek.enable = true;
    tmux.enable = true;
  };

  desktop = {
    waybar.x230t.enable = true;
    hyprland = {
      enable = true;
      hyprgrass.enable = true;
      x230t.enable = true;
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    "${pkgs.swww}/bin/swww-daemon --format xrgb"
  ];

  # programs.swww = {
  #   hyprlandIntegration.enable = true;
  #   enable = true;
  #   monitors."LVDS-1".wallpaper =
  #     "../../../modules/homeManager/desktop/wallpapers/liminal-room.jpg";
  #   # "${self}/modules/homeManager/desktop/wallpapers/liminal-room.jpg";
  # };
}
