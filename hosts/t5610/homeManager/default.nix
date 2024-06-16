{ self, config, ... }:

{
  imports = [
    "${self}/modules/homeManager"
    # "${self}/custom/homeManager"
  ];

  desktop = {
    chromium.enable = true;
    firefox.enable = true;
    fuzzel.enable = true;
    hyprland = {
      enable = true;
    #   hyprexpo.enable = true;
      t5610.enable = true;
    };
    kitty.enable = true;
    sioyek.enable = true;
    vesktop.enable = true;
    waybar.t5610.enable = true;
  };

  development = {
    git.enable = true;
  };

  terminal = {
    bat.enable = true;
    tmux.enable = true;
  };

  # app = {
  #   git.enable = true;
  #   kitty.enable = true;
  #   tmux.enable = true;
  #   sioyek.enable = true;
  # };
  #
  # desktop = {
  #   waybar.t5610.enable = true;
  #   # kitty.enable = true;
  #   hyprland = {
  #     enable = true;
  #     t5610.enable = true;
  #     pyprland = {
  #       enable = true;
  #       btm.enable = true;
  #       claude.enable = true;
  #       hmOptions.enable = true;
  #       nixpkgs.enable = true;
  #       noogle.enable = true;
  #       spotube.enable = true;
  #     };
  #   };
  # };

  # programs.swww = {
  #   hyprlandIntegration.enable = true;
  #   enable = true;
  #   monitors = {
  #     "DP-1".wallpaper = "${config.xdg.configHome}/wallpapers/liminal-tv.jpg";
  #     "DP-2".wallpaper = "${config.xdg.configHome}/wallpapers/liminal-hall.jpg";
  #   };
  # };
}
