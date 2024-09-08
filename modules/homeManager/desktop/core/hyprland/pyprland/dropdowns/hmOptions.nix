{ lib, config, ... }:
let
  cfg = config.desktop.hyprland.pyprland.hmOptions;
in
{
  options.desktop.hyprland.pyprland.hmOptions.enable = lib.mkEnableOption "enable pyprland claude dropdown";

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
