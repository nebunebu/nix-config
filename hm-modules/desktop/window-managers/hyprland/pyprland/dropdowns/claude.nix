{ lib, config, ... }:
let
  cfg = config.neb.desktop.window-managers.hyprland.pyprland.claude;
in
{
  options.neb.desktop.window-managers.hyprland.pyprland.claude.enable = lib.mkEnableOption "enable pyprland claude dropdown";

  config = lib.mkIf cfg.enable {
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.claude]
          command = "firefox -P claude"
          animation = "fromTop"
          lazy = true
          size = "80% 80%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        bind = [ "ALT_L, c, exec, pypr toggle claude" ];
      };
    };
  };
}
