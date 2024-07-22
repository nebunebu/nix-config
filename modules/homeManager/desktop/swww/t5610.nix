{
  self,
  lib,
  config,
  ...
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
        "DP-1".wallpaper = ", ${./liminal-tv.jpg}";
        "HDMI-A-1".wallpaper = ", ${./liminal-hall.jpg}";
      };
    };
  };
}
