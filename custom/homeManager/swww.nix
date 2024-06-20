{ pkgs
, config
, lib
, ...
}:

# TODO: activate daemon if not running
# TODO: add package option
# TODO: add transitions
# TODO: add fill

let
  cfg = config.programs.swww;
  entryToStr = monitor: entry: "${pkgs.swww}/bin/swww img -o ${monitor} ${entry.wallpaper}";
in
{
  options = {
    programs.swww = {
      enable = lib.mkEnableOption "enable swww program";

      monitors = lib.mkOption {
        type = with lib.types; attrsOf (submodule {
          options = {
            wallpaper = lib.mkOption { type = str; };
          };
        });
        default = { };
      };

      hyprlandIntegration = {
        enable = lib.mkEnableOption "enable Hyprland integration";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.swww
    ];

    wayland.windowManager.hyprland.settings.exec-once = lib.mkIf cfg.hyprlandIntegration.enable [
      "${pkgs.swww}/bin/swww-daemon --format xrgb"
    ];

    systemd.user.services.swww-wp = {
      Install.WantedBy = [ "default.target" ];
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.writeShellScript "swww-wp" ''
          ${lib.concatStringsSep "\n" (lib.mapAttrsToList entryToStr cfg.monitors)}
        ''}";
      };
    };
  };
}
