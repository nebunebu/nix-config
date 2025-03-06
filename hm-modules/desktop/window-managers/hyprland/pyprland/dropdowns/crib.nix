{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.window-managers.hyprland.pyprland.crib;
  cribPkg = pkgs.callPackage ../../../../../../pkgs/crib.nix { };
in
{
  options.neb.desktop.window-managers.hyprland.pyprland.crib.enable =
    lib.mkEnableOption "enable pyprland crib dropdown";

  config = lib.mkIf cfg.enable {
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [scratchpads.crib]
          command = "${pkgs.foot}/bin/foot -e ${lib.getExe cribPkg}"
          # command = "hyprctl dispatch exec \"[float; size 90% 90%] foot -e ${lib.getExe cribPkg}\""
          animation = "fromTop"
          class = "crib"
          lazy = true
          size = "90% 90%"
        '';
    };

    wayland.windowManager.hyprland = {
      settings = {
        windowrulev2 = [ "float, class:^(foot)$" ];
        bind = [ "ALT_L, c, exec, pypr toggle crib" ];
      };
    };
  };
}
