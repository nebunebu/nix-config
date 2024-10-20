{ lib
, pkgs
, self
, config
, unstablePkgs
, ...
}:
let
  cfg = config.desktop.core.hyprland.pyprland.spotube;
in
{
  options.desktop.core.hyprland.pyprland.spotube.enable = lib.mkEnableOption "enable pyprland spotube dropdown";

  config = lib.mkIf cfg.enable {

    home.packages = [
      (pkgs.callPackage ../../../../../../../pkgs/spotube.nix { })
    ];

    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.spotube]
          command = "${(pkgs.callPackage ../../../../../../../pkgs/spotube.nix { })}/bin/spotube"
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
