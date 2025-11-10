{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.neb.desktop.hyprland;
in
{
  options.neb.desktop.hyprland = {
    enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = [
      pkgs.glaze
      pkgs.hyprgraphics
      # pkgs.aquamarine
    ];

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
    # environment.sessionVariables = {
    #   WLR_RENDERER = "vulkan";
    #   AMD_VULKAN_ICD = "RADV";
    #   LIBVA_DRIVER_NAME = "radeonsi";
    # };

    programs.hyprland = {
      enable = true;
      # withUWSM = true;
      # package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
    };

    xdg.portal = {
      enable = true;
      # wlr.enable = false;
      configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];
    };
  };
}
