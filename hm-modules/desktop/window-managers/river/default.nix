{ pkgs
, lib
, config
, ...
}:
let
  cfg = config.neb.desktop.window-managers.river;
in
{
  options.neb.desktop.window-managers.river.enable = lib.mkEnableOption "river";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.river = {
      enable = true;
      extraConfig = ''
        rivertile -view-padding 6 -outer-padding 6 &
      '';
      extraSessionVariables = {
        MOZ_ENABLE_WAYLAND = "1";
      };
      settings = {
        map = {
          normal = {
            "Super Return" = "spawn ghostty";
            "Super I" = "spawn firefox";
            "Super P" = "spawn fuzzel";
            "Super X" = "close";
          };
        };
        default-layout = "rivertile";
        set-repeat = "50 300"; # Key repeat rate and delay
      };
    };
  };
}
