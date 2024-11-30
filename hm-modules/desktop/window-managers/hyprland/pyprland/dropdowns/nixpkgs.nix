{ lib, config, ... }:
let
  cfg = config.neb.desktop.window-managers.hyprland.pyprland.nixpkgs;
in
{
  options.neb.desktop.window-managers.hyprland.pyprland.nixpkgs.enable = lib.mkEnableOption "enable pyprland nipkgs dropdown";

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
