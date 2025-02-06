{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.jellyfin;
in
{

  options.neb.jellyfin = {
    enable = lib.mkEnableOption "enable jellyfin";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = [
      pkgs.jellyfin-media-player
      pkgs.jellyfin-mpv-shim
    ];

    users = {
      users = {
        nebu.extraGroups = [ "jellyfin" ];
        jellyfin = {
          isSystemUser = true;
          group = "jellyfin";
          extraGroups = [
            "video"
            "render"
          ];
        };
      };
      groups.jellyfin = { };
    };

    services = {
      jellyfin = {
        enable = true;
        openFirewall = true;
      };
      jellyseerr = {
        enable = true;
        openFirewall = true;
      };
    };

    systemd.tmpfiles.rules = [
      "d /srv/jellyfin 0770 jellyfin jellyfin -"
      "d /srv/jellyfin/Movies 0770 jellyfin jellyfin -"
      "d /srv/jellyfin/Shows 0770 jellyfin jellyfin -"
      "d /srv/jellyfin/Courses 0770 jellyfin jellyfin -"
      "d /srv/jellyfin/Other 0770 jellyfin jellyfin -"
    ];
  };
}
