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
    # zsh.enable = true;
    theme.enable = true;
  };

  #  services.git-sync = {
  #    enable = true;
  #    repositories = {
  #      test-git-sync = {
  #        path = "/home/nebu/test-git-sync";
  # uri = "git@github.com:nebunebu/test-git-sync.git";
  # interval = 60;
  #      };
  #    };
  #  };


  programs.swww = {
    hyprlandIntegration.enable = true;
    enable = true;
    monitors =
      let
        wp = "${config.home.homeDirectory}/.nix-config/modules/homeManager/wallpapers/";
      in
      {
        "DP-1" = {
          wallpaper = "${wp}/liminal-tv.jpg";
        };
        "DP-2" = {
          wallpaper = "${wp}/liminal-hall.jpg";
        };
      };
  };
}
