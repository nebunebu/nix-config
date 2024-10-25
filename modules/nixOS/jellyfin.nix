{ pkgs, ... }:

{
  users.users.nebu.extraGroups = [ "jellyfin" ];

  environment.systemPackages = [
    pkgs.jellyfin-media-player
    pkgs.jellyfin-mpv-shim
  ];

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
}
