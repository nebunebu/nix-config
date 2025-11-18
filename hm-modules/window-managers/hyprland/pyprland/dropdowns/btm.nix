{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.window-managers.hyprland.pyprland.btm;
in
{
  options.hm.window-managers.hyprland.pyprland.btm.enable =
    lib.mkEnableOption "enable pyprland btm dropdown";

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.bottom ];
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.btm]
          command = "kitty --class=\"kitty-btm\" zsh -c \"btm\""
          animation = "fromTop"
          class = "kitty-btm"
          lazy = true
          size = "75% 65%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        windowrulev2 = [ "float, class:^(kitty-btm)$" ];
        bind = [ "ALT_L, b, exec, pypr toggle btm" ];
      };
    };
  };
}
