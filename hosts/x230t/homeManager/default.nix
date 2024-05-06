# let
#   liminalRoom = pkgs.copyFile {
#     name = "liminal-room.jpg";
#     src = ../../../modules/homeManager/wallpapers/liminal-room.jpg;
#   };
# in
{
  imports = [
    ../../../modules/homeManager
  ];

  app = {
    git.enable = true;
    kitty.enable = true;
    sioyek.enable = true;
    tmux.enable = true;
    # zsh.enable = true;
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
    monitors =
      # let
      #   wp = "${config.home.homeDirectory}/.nix-config/modules/homeManager/wallpapers/";
      # in
      {
        # "LVDS-1".wallpaper = "${wp}/liminal-room.jpg";
        "LVDS-1".wallpaper = "liminalRoom";
      };
  };
}
