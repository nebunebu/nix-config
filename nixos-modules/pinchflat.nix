{ lib, config, ... }:

let
  cfg = config.neb.pinchflat;
in
{
  options.neb.pinchflat = {
    enable = lib.mkEnableOption "Pinchflat YouTube downloader";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      autoPrune.enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

    systemd.tmpfiles.rules = [
      "d /srv/pinchflat 0770 pinchflat jellyfin -"
      "d /srv/pinchflat/config 0770 pinchflat jellyfin -"
      "d /srv/jellyfin/Youtube 0770 jellyfin jellyfin -"
    ];

    users.users.pinchflat = {
      isSystemUser = true;
      group = "pinchflat";
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
          "8945:8945/tcp"
        ];
        volumes = [
          "/srv/pinchflat/config:/config:rw"
          "/srv/jellyfin/Youtube:/downloads:rw"
        ];
        log-driver = "journald";
        autoStart = true;
      };
    };
    networking.firewall.allowedTCPPorts = [ 8945 ];
  };
}
