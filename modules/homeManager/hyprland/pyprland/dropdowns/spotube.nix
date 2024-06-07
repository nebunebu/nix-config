{ lib, config, unstablePkgs, ... }:
let
  cfg = config.desktop.hyprland.pyprland.spotube;
in
{
  options.desktop.hyprland.pyprland.spotube.enable = lib.mkEnableOption "enable pyprland spotube dropdown";

  config = lib.mkIf cfg.enable {

    home.packages = [ unstablePkgs.spotube ];

    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = /*toml*/ ''
        [scratchpads.spo]
        command = "${unstablePkgs.spotube}/bin/spotube"
        animation = "fromTop"
        class = "spotube"
        lazy = true
        size = "80% 80%"
      '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        bind = [
          "ALT_L, s, exec, pypr toggle spotube"
        ];
      };
    };
  };
}
