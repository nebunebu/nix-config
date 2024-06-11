{ self, inputs, config, pkgs, ... }:

{
  imports = [
    "${self}/modules/homeManager"
    "${self}/custom/homeManager"
  ];

  home.packages = [
    inputs.swww.packages.x86_64-linux.default
    # pkgs.swww 
  ];

  programs.xournalpp = {
    enable = true;

    palette = /* gpl */ ''
      GIMP Palette
      Name: Xournal Default Palette
      #
      196 167 231 Black
      0 128 0 Green
      0 192 255 Light Blue
      0 255 0 Light Green
      51 51 204 Blue
      128 128 128 Gray
      255 0 0 Red
      255 0 255 Magenta
      255 128 0 Orange
      255 255 0 Yellow
      255 255 255 White
    '';
  };

  app = {
    git.enable = true;
    kitty.enable = true;
    sioyek.enable = true;
    tmux.enable = true;
  };

  tablet = {
    wvkbd.enable = true;
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
