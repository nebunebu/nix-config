{ config
, lib
, pkgs
, ...
}:
let
  cfg = config.neb.desktop.window-managers.hyprland.hyprpicker;
in
{
  options.neb.desktop.window-managers.hyprland.hyprpicker.enable = lib.mkEnableOption "enable hyprpicker";

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.hyprpicker
      (pkgs.writeShellScriptBin "hyprpicker-wl-copy" ''
        ${pkgs.hyprpicker}/bin/hyprpicker \
        | tee >(${pkgs.wl-clipboard}/bin/wl-copy) \
        >(${pkgs.libnotify}/bin/notify-send "Color picked" "$(cat)") \
        >/dev/null
      '')
    ];
  };
}
