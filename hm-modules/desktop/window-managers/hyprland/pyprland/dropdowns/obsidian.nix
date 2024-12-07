{ lib, config, unstablePkgs, ... }:
let
  cfg = config.neb.desktop.window-managers.hyprland.pyprland.obsidian;
in
{
  options.neb.desktop.window-managers.hyprland.pyprland.obsidian.enable = lib.mkEnableOption "enable pyprland obsidian dropdown";

  config = lib.mkIf cfg.enable {
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.obsidian]
          command = "${unstablePkgs.obsidian}/bin/obsidian --disable-gpu"
          animation = "fromTop"
          lazy = true
          class = "obsidian"
          size = "80% 80%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        bind = [ "ALT_L, o, exec, pypr toggle obsidian" ];
      };
      settings = {
        windowrulev2 = [
          "float,class:^(obsidian)$"
          "center,class:^(obsidian)$"
          "size 80% 80%,class:^(obsidian)$"
        ];
      };

    };
  };
}
