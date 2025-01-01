{ lib, config, ... }:

let
  cfg = config.neb.pinchflat;
in
{
  options.neb.pinchflat = {
    enable = lib.mkEnableOption "Pinchflat YouTube downloader";
  };

  config = lib.mkIf cfg.enable {
    systemd.tmpfiles.rules = [
      "d /srv/pinchflat 0770 pinchflat jellyfin -"
      "d /srv/pinchflat/config 0770 pinchflat jellyfin -"
    ];

    users.users.pinchflat = {
      isSystemUser = true;
      group = "jellyfin";
      extraGroups = [ "jellyfin" ];
    };
    users.groups.pinchflat = { };

    virtualisation.oci-containers = {
      backend = "podman";
      containers.pinchflat = {
        image = "ghcr.io/kieraneglin/pinchflat:latest";
        environment = {
          TZ = config.time.timeZone;
        };
        ports = [
          "8945:8945"
        ];
        volumes = [
          "/srv/pinchflat/config:/config"
          "/srv/jellyfin/Youtube:/downloads"
        ];
        autoStart = true;
        user = "pinchflat";
      };
    };
  };
}
