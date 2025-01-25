{ inputs
, pkgs
, config
, lib
, ...
}:
let
  cfg = config.neb.desktop.astal;
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  options = {
    neb.desktop.astal = {
      x230t.enable = lib.mkEnableOption "enable x230t astal setup";
      t5610.enable = lib.mkEnableOption "enable t5610 astal setup";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.t5610.enable {

      wayland.windowManager.hyprland.settings.exec-once = [
        "ags run"
      ];

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
          inputs.ags.packages.${pkgs.system}.network
          inputs.ags.packages.${pkgs.system}.battery
        ];
      };
    })

    (lib.mkIf cfg.x230t.enable {
      wayland.windowManager.hyprland.settings.exec-once = [
        "ags run"
      ];

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
          inputs.ags.packages.${pkgs.system}.network
          inputs.ags.packages.${pkgs.system}.battery

          # apps: package 'astal-apps-0.1.0'
          # astal3: package 'astal-3.0.0'
          # astal4: package 'astal-4.0.0'
          # auth: package 'astal-auth-0.1.0'
          # battery: package 'astal-battery-0.1.0'
          # bluetooth: package 'astal-bluetooth-0.1.0'
          # cava: package 'astal-cava-0.1.0'
          # default: package 'ags-2.1.0'
          # docs: package 'reference'
          # gjs: package 'astal-gjs'
          # greet: package 'astal-greet-0.1.0'
          # hyprland: package 'astal-hyprland-0.1.0'
          # io: package 'astal-0.1.0'
          # mpris: package 'astal-mpris-0.1.0'
          # network: package 'astal-network-0.1.0'
          # notifd: package 'astal-notifd-0.1.0'
          # powerprofiles: package 'astal-power-profiles-0.1.0'
          # river: package 'astal-river-0.1.0'
          # tray: package 'astal-tray-0.1.0'
          # wireplumber: package 'astal-wireplumber-0.1.0'
        ];
      };
    })
  ];
}
