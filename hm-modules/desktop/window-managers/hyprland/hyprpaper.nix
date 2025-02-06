{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.window-managers.hyprland.hyprpaper;
in
{
  options = {
    neb.desktop.window-managers.hyprland.hyprpaper = {
      device = lib.mkOption {
        type = lib.types.nullOr (
          lib.types.enum [
            "x230t"
            "t5610"
          ]
        );
        default = null;
        description = "Select the device configuration for hyprpaper";
      };
      x230t.enable = lib.mkEnableOption "enable x230t hyprpaper setup";
      t5610.enable = lib.mkEnableOption "enable t5610 hyprpaper setup";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.x230t.enable {
      wayland.windowManager.hyprland.settings.exec-once = [ "${lib.getExe pkgs.hyprpaper}" ];

      services.hyprpaper = {
        enable = true;
        settings =
          let
            wallpaper_1 = builtins.fetchurl {
              url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/roseified-wallhaven-6dr226.jpg";
              sha256 = "1qrjiy26cspxj5azxi0p9jvxqk8izz802wzy37psxikjk5c0lzcj";
            };
          in
          {
            ipc = "on";
            splash = false;
            preload = [
              "${wallpaper_1}"
            ];
            wallpaper = [
              "LVDS-1, ${wallpaper_1}"
            ];
          };
      };
    })

    (lib.mkIf cfg.t5610.enable {

      wayland.windowManager.hyprland.settings.exec-once = [ "${lib.getExe pkgs.hyprpaper}" ];

      services.hyprpaper = {
        enable = true;
        settings =
          let
            wallpaper_1 = builtins.fetchurl {
              url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/roseified-wallhaven-l81kkr.jpg";
              sha256 = "05pbqa6dd0xzzx60q6fq56j6zzrga85vlfycnq7ng86zbd2kp5xc";
            };
            wallpaper_2 = builtins.fetchurl {
              url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/roseified-wallhaven-vq6yy5.jpg";
              sha256 = "173d02fmwd2w0jvih35z889dhqxqjwv4j9lchr7calmybvhpv1gr";
            };
          in
          {
            ipc = "on";
            splash = false;
            preload = [
              "${wallpaper_1}"
              "${wallpaper_2}"
            ];
            wallpaper = [
              "DP-1, ${wallpaper_1}"
              "HDMI-A-1, ${wallpaper_2}"
            ];
          };
      };
    })
  ];
}
