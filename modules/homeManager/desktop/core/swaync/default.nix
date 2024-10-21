{ lib
, config
, pkgs
, ...
}:
let
  cfg = config.desktop.core.swaync;
in
{
  imports = [ ./style.nix ];

  options = {
    desktop.core.swaync.enable = lib.mkEnableOption "enable swaync";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      pkgs.libnotify
      pkgs.gnome.adwaita-icon-theme
    ];

    services.swaync = {
      enable = true;
      settings = {
        positionX = "right";
        positionY = "top";
        layer = "overlay";
        control-center-layer = "top";
        layer-shell = true;
        cssPriority = "application";
        control-center-margin-top = 0;
        control-center-margin-bottom = 0;
        control-center-margin-right = 0;
        control-center-margin-left = 0;
        widgets = [
          "title"
          "dnd"
          "inhibitors"
          "label"
          "buttons-grid"
          "mpris"
          "volume"
        ];
        mpris = {
          image-size = 96;
          image-radius = 7;
          blur = false;
        };
        notification-2fa-action = true;
        notification-inline-replies = false;
        notification-icon-size = 64;
        notification-body-image-height = 100;
        notification-body-image-width = 200;
      };
    };
  };
}
