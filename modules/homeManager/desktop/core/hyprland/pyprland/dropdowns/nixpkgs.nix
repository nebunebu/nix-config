{ lib, config, ... }:
let
  cfg = config.desktop.core.hyprland.pyprland.nixpkgs;
in
{
  options.desktop.core.hyprland.pyprland.nixpkgs.enable = lib.mkEnableOption "enable pyprland nipkgs dropdown";

  config = lib.mkIf cfg.enable {
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.nixpkgs]
          command = "firefox -P nixpkgs"
          animation = "fromTop"
          lazy = true
          size = "80% 80%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        bind = [ "ALT_L, p, exec, pypr toggle nixpkgs" ];
      };
    };
  };
}
