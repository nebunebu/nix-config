{ inputs
, pkgs
, config
, lib
, ...
}:
let
  cfg = config.neb.desktop.core.astal;
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  options = {
    neb.desktop.core.astal = {
      x230t.enable = lib.mkEnableOption "enable x230t waybar setup";
      t5610.enable = lib.mkEnableOption "enable t5610 astal setup";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.t5610.enable {
      home.packages = [
        inputs.ags.packages.${pkgs.system}.io
        pkgs.rose-pine-icon-theme
        pkgs.gnome.adwaita-icon-theme
        pkgs.morewaita-icon-theme
        pkgs.libdbusmenu-gtk3
      ];
      programs.ags = {
        enable = true;
        extraPackages = with pkgs; [
          pkgs.rose-pine-icon-theme
          pkgs.libdbusmenu-gtk3
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
