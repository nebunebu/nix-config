{ self, config, ... }:

{
  imports = [
    "${self}/modules/homeManager"
  ];

  # home.file."test.txt".text =
  #   let
  #     colors = import "${self}/custom/functions/color.nix";
  #     # hexToRGBWithCommas = (import "${self}/custom/functions/color.nix").hexToRGBWithCommas;
  #     # hextoRGBWithCommas gold #f6177 rgb(${hexToRGBWithCommas "f6177"})
  #   in
  #   ''
  #     hextoRGB gold #f6177 ${colors.hexToRGB "f6177"}
  #   '';

  desktop = {
    chromium.enable = true;
    firefox.enable = true;
    fuzzel.enable = true;
    hyprland = {
      enable = true;
        hyprexpo.enable = true;
      t5610.enable = true;
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

  # app = {
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
}
