{ self
, lib
, config
, ...
}:
let
  cfg = config.desktop.swww.t5610;
in
{
  imports = [ "${self}/custom/homeManager/swww.nix" ];

  options.desktop.swww = {
    t5610.enable = lib.mkEnableOption "enable swww settings for t5610";
  };

  config = lib.mkIf cfg.enable {
    programs.swww = {
      enable = true;
      hyprlandIntegration.enable = true;
      monitors = {
        "DP-1".wallpaper = builtins.fetchurl {
          url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/liminal-tv.jpg";
          sha256 = "1mvvmc5nj45apbiqlia02vnnmmjpzb88v921zl2pjddkzsdhzi3s";
        };
        "HDMI-A-1".wallpaper = builtins.fetchurl {
          url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/liminal-hall.jpg";
          sha256 = "0lc71a7i3x1df7vl9n65pp0xgpnn23jj3j07hdpvvgrib475yqlq";
        };
      };
    };
  };
}
