{ inputs
, pkgs
, lib
, config
, ...
}:
let
  cfg = config.neb.desktop.hyprland;
in
{
  options.neb.desktop.hyprland = {
    enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = [ unstablePkgs.glxinfo ];

    nix = {
      settings = {
        substituters = [
          "https://hyprland.cachix.org"
          "https://cache.nixos.org/"
        ];
        trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        ];
      };
    };

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      # package = unstablePkgs.hyprland;
    };

    hardware = {
      opengl = {
        package = unstablePkgs.mesa.drivers;
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

    xdg.portal = {
      enable = true;
      wlr.enable = false;
      configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
