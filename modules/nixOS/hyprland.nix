{ pkgs, lib, config, ... }:

{
  options = {
    desktop.hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf config.desktop.hyprland.enable {

    programs.hyprland = {
      enable = true;
      # package = unstablePkgs.hyprland;
    };

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
