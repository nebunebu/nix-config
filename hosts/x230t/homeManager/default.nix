{ self, inputs, config, pkgs, ... }:

{
  imports = [
    "${self}/modules/homeManager"
    "${self}/custom/homeManager"
  ];


  tablet = {
    wvkbd.enable = true;
  };

  terminal = {
    bat.enable = true;
    tmux.enable = true;
  };

  desktop = {
    chromium.enable = true;
    firefox.enable = true;
    fuzzel.enable = true;
    hyprland = {
      enable = true;
      hyprgrass.enable = true;
      hyprexpo.enable = true;
      x230t.enable = true;
    };
    kitty.enable = true;
    sioyek.enable = true;
    vesktop.enable = true;
    waybar.x230t.enable = true;
  };

  development = {
    git.enable = true;
  };

  home.packages = [
    inputs.swww.packages.x86_64-linux.default
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "${inputs.swww.packages.x86_64-linux.default}/bin/swww-daemon --format xrgb"
  ];

  # programs.swww = {
  #   hyprlandIntegration.enable = true;
  #   enable = true;
  #   monitors."LVDS-1".wallpaper =
  #     "../../../modules/homeManager/desktop/wallpapers/liminal-room.jpg";
  #   # "${self}/modules/homeManager/desktop/wallpapers/liminal-room.jpg";
  # };
}
