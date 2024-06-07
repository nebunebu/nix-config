{ lib, config, ... }:
let
  cfg = config.desktop.hyprland.pyprland.claude;
in
{
  options.desktop.hyprland.pyprland.claude.enable = lib.mkEnableOption "enable pyprland claude dropdown";

  config = lib.mkIf cfg.enable {
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = /*toml*/ ''
        [scratchpads.claude]
        command = "firefox -P claude"
        animation = "fromTop"
        lazy = true
        size = "80% 80%"
      '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        # windowrulev2 = [
        #   "float, class:^(kitty-btm)$"
        # ];
        bind = [
          "ALT_L, c, exec, pypr toggle claude"
        ];
      };
    };
  };
}
