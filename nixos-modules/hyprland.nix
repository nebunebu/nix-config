{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.nos.desktop.hyprland;
in
{
  options.nos.desktop.hyprland = {
    enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = [
      pkgs.glaze
      pkgs.hyprgraphics
      # pkgs.aquamarine
    ];

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
