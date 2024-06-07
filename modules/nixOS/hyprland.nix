{ inputs, pkgs, lib, config, ... }:
let
  cfg = config.desktop.hyprland;
in
{
  options.desktop.hyprland = {
    enable = lib.mkEnableOption "enable hyprland";

    package = lib.mkPackageOption pkgs "hyprland" {
      default = [ "" ];
    };
  };

  config = lib.mkIf cfg.enable {

    # home-manager.users.nebu.wayland.windowManager.hyprland.package =
    #   lib.mkIf (cfg.package != null)
    #     {
    #       # cfg.package;
    #     };
    #
    # programs.hyprland.package =
    #   lib.mkIf (cfg.package != null)
    #     {
    #       # cfg.package;
    #     };

    programs.hyprland.enable = true;

    environment = {
      systemPackages = [
        pkgs.wl-clipboard
      ];

      sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
    };

    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
    };

    services = {
      pipewire = {
        enable = true;
        audio.enable = true;
        pulse.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        jack.enable = true;
      };
    };

    # security = {
    #   rtkit.enable = true;
    #   polkit = {
    #     enable = true;
    #     adminIdentities = [ "unix-group:wheel" ];
    #   };
    # };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      configPackages = [
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };
}
