{ self, inputs, config, pkgs, ... }:

{
  imports = [
    "${self}/modules/homeManager"
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
    swww.x230t.enable = true;
    vesktop.enable = true;
    waybar.x230t.enable = true;
  };

  development = {
    git.enable = true;
  };
}
