{
  self,
  lib,
  config,
  ...
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
        "LVDS-1".wallpaper = ", ${./liminal-room.jpg}";
      };
    };
  };
}
