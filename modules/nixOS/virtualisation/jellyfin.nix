# { pkgs, ... }:

{
  # environment.systemPackages = [
  #   pkgs.jellyfin-media-player
  #   pkgs.jellyfin-mpv-shim
  #   pkgs.jellycli
  # ];

  users.users.nebu.extraGroups = [ "docker" ];

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      "jellyfin" = {
        autoStart = true;
        image = "jellyfin/jellyfin";
        hostname = "jellyfin";
        workdir = "/var/lib/jellyfin";
        ports = [ "8096:8096" ];
        volumes = [ "/srv/jellyfin:/media" ];
        extraOptions = [
          "--dns=172.17.0.1"
        ];
      };
    };
  };

  systemd.tmpfiles.settings."jellyfin" = {
    "/srv/jellyfin/Movies" = {
      d = {
        group = "users";
        mode = "770";
        user = "nebu";
        age = "-";
      };
    };
  };
}
