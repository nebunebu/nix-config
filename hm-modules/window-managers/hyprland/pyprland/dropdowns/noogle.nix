{ lib, config, ... }:
let
  cfg = config.opts.window-managers.hyprland.pyprland.noogle;
in
{
  options.opts.window-managers.hyprland.pyprland.noogle.enable =
    lib.mkEnableOption "enable pyprland noogle dropdown";

  config = lib.mkIf cfg.enable {
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.noogle]
          command = "firefox -P noogle"
          animation = "fromTop"
          lazy = true
          size = "80% 80%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        bind = [ "ALT_L, n, exec, pypr toggle noogle" ];
      };
    };
  };
}
