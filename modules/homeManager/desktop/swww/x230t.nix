{ self
, lib
, config
, ...
}:
let
  cfg = config.desktop.swww.x230t;
in
{
  imports = [ "${self}/custom/homeManager/swww.nix" ];

  options.desktop.swww = {
    x230t.enable = lib.mkEnableOption "enable swww settings for x230t";
  };

  config = lib.mkIf cfg.enable {
    programs.swww = {
      enable = true;
      hyprlandIntegration.enable = true;
      monitors = {
        "LVDS-1".wallpaper = builtins.fetchurl {
          url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/liminal-room.jpg";
          sha256 = "03nd06pc57zs2vwns1zq6b2rzczpqxxqcax1pffp0gzcx66nmgmr";
        };
      };
    };
  };
}
