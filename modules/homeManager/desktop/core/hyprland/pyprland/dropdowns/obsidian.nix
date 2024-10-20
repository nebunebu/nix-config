{ lib, config, unstablePkgs, ... }:
let
  cfg = config.desktop.core.hyprland.pyprland.obsidian;
in
{
  options.desktop.core.hyprland.pyprland.obsidian.enable = lib.mkEnableOption "enable pyprland obsidian dropdown";

  config = lib.mkIf cfg.enable {
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.obsidian]
          # command = "obsidian --disable-gpu"
          command = "${unstablePkgs.obsidian}/bin/obsidian --disable-gpu"
          animation = "fromTop"
          lazy = true
          size = "80% 80%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        bind = [ "ALT_L, o, exec, pypr toggle obsidian" ];
      };
    };
  };
}
