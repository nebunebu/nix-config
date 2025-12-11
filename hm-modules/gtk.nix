{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.gtk;
in
{
  options.hm.gtk = {
    enable = lib.mkEnableOption "enable gtk";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.gvfs # Thumbnail support for various file types
      pkgs.ffmpegthumbnailer # Video thumbnails specifically
      pkgs.webp-pixbuf-loader # WebP image thumbnails
    ];

    gtk = lib.mkForce {
      enable = true;

      gtk3.extraConfig = {
        gtk-enable-thumbnails = true;
        gtk-thumbnail-max-size = 10485760; # 10MB - files larger than this won't get thumbnails
      };

      gtk4.extraConfig = {
        gtk-enable-thumbnails = true;
        gtk-thumbnail-max-size = 10485760;
      };
    };
  };
}
