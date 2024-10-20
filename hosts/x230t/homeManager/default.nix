{ self
, inputs
, config
, pkgs
, ...
}:

{
  imports = [ "${self}/modules/homeManager" ];

  home.packages = [
    # pkgs.zoom
    # pkgs.aileron
  ];

  tablet = {
    wvkbd.enable = true;
  };

  terminal = {
    bat.enable = true;
    tmux.enable = true;
  };

  # TODO: rename gates with custom namespace
  neb.desktop.core.hyprland.hyprpaper.t5610.enable = true;
  desktop = {
    chromium.enable = true;
    firefox.enable = true;
    fuzzel.enable = true;
    hyprland = {
      enable = true;
      hyprgrass.enable = false;
      hyprexpo.enable = false;
      x230t.enable = true;
    };
    kitty.enable = true;
    mpv.enable = true;
    sioyek.enable = true;
    swww.x230t.enable = false;
    vesktop.enable = true;
    waybar.x230t.enable = true;
  };

  development = {
    git.enable = true;
  };
}
