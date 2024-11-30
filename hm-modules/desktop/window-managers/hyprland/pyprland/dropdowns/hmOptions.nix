{ lib, config, ... }:
let
  cfg = config.neb.desktop.window-managers.hyprland.pyprland.hmOptions;
in
{
  options.neb.desktop.window-managers.hyprland.pyprland.hmOptions.enable = lib.mkEnableOption "enable pyprland hm-options dropdown";

  config = lib.mkIf cfg.enable {
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.hm-options]
          command = "firefox -P hm-options"
          animation = "fromTop"
          lazy = true
          size = "80% 80%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        bind = [ "ALT_L, h, exec, pypr toggle hm-options" ];
      };
    };
  };
}
