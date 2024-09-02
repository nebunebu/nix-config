{ self, ... }:

{
  imports = [
    "${self}/modules/homeManager"
  ];

  desktop = {
    chromium.enable = true;
    firefox.enable = true;
    fuzzel.enable = true;
    mpv.enable = true;
    hyprland = {
      enable = true;
      hyprexpo.enable = false;
      t5610.enable = true;
      pyprland = {
        enable = true;
        btm.enable = true;
        claude.enable = true;
        hmOptions.enable = true;
        nixpkgs.enable = true;
        noogle.enable = true;
        spotube.enable = true;
      };
    };
    kitty.enable = true;
    sioyek.enable = true;
    swww.t5610.enable = true;
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
}
