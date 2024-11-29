{ inputs
, pkgs
, config
, lib
, ...
}:
let
  cfg = config.neb.desktop.ui.astal;
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  options = {
    neb.desktop.ui.astal = {
      x230t.enable = lib.mkEnableOption "enable x230t astal setup";
      t5610.enable = lib.mkEnableOption "enable t5610 astal setup";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.t5610.enable {
      home.packages = [
        inputs.ags.packages.${pkgs.system}.io
        pkgs.rose-pine-icon-theme
        pkgs.adwaita-icon-theme
        pkgs.morewaita-icon-theme
        pkgs.libnotify
      ];

      #NOTE: move to system module
      # services.dbus = {
      #   enable = true;
      #   packages = [ pkgs.libdbusmenu-gtk3 ];
      # };
      programs.ags = {
        enable = true;
        extraPackages = with pkgs; [
          rose-pine-icon-theme
          libdbusmenu-gtk3
          glib
          gtk3
          gobject-introspection
          fzf
          dart-sass
          inputs.ags.packages.${pkgs.system}.notifd
          inputs.ags.packages.${pkgs.system}.apps
          inputs.ags.packages.${pkgs.system}.gjs
          inputs.ags.packages.${pkgs.system}.hyprland
          inputs.ags.packages.${pkgs.system}.mpris
          inputs.ags.packages.${pkgs.system}.tray
          inputs.ags.packages.${pkgs.system}.wireplumber
        ];
      };
    })

    (lib.mkIf cfg.x230t.enable {
      programs.ags = {
        enable = true;
      };
    })
  ];
}
