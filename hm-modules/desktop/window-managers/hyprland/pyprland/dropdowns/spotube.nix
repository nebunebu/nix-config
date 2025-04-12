{
  lib,
  masterPkgs,
  config,
  ...
}:
let
  cfg = config.neb.desktop.window-managers.hyprland.pyprland.spotube;
in
{
  options.neb.desktop.window-managers.hyprland.pyprland.spotube.enable =
    lib.mkEnableOption "enable pyprland spotube dropdown";

  config = lib.mkIf cfg.enable {

    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.spotube]
          command = "${masterPkgs.spotube}/bin/spotube"
          animation = "fromTop"
          class = "spotube"
          lazy = true
          size = "80% 80%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        bind = [ "ALT_L, s, exec, pypr toggle spotube" ];
      };
    };
  };
}
