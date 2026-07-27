{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nos.self-hosted.cloudflared;
  tunnel = "cbd1b808-d80c-4afc-bc94-8c0838deae3e";
in
{
  options.nos.self-hosted.cloudflared = {
    enable = lib.mkEnableOption "cloudflared";

    # These used to point into /home/nebu/.cloudflared. A system service reading
    # credentials out of a user's home is fragile: it depends on that user
    # existing, on home permissions, and on nobody deleting the directory.
    #
    # The service runs with DynamicUser and pulls both files in via
    # LoadCredential, which systemd reads as root before dropping privileges --
    # so root-owned 0600 is what these want, not a service-user chown.
    #
    # MIGRATION: move the files once, on the host, before deploying:
    #   sudo mkdir -p /var/lib/cloudflared
    #   sudo mv /home/nebu/.cloudflared/{cert.pem,<tunnel>.json} /var/lib/cloudflared/
    #   sudo chown -R root:root /var/lib/cloudflared
    #   sudo chmod 0600 /var/lib/cloudflared/*
    stateDir = lib.mkOption {
      type = lib.types.path;
      default = "/var/lib/cloudflared";
      description = "Directory holding the tunnel certificate and credentials.";
    };
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = [
      pkgs.cloudflared
    ];

    systemd.tmpfiles.rules = [
      "d ${cfg.stateDir} 0700 root root -"
    ];

    networking.nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    services.cloudflared = {
      enable = true;
      certificateFile = "${cfg.stateDir}/cert.pem";
      tunnels = {
        ${tunnel} = {
          credentialsFile = "${cfg.stateDir}/${tunnel}.json";
          ingress = {
            "13ft.nebunebu.xyz".service = "http://127.0.0.1:3001";
            "beaverhabit.nebunebu.xyz".service = "http://127.0.0.1:8081";
            "freshrss.nebunebu.xyz".service = "http://127.0.0.1:80";
            "glance.nebunebu.xyz".service = "http://127.0.0.1:3000";
            "jellyfin.nebunebu.xyz".service = "http://127.0.0.1:8096";
            "linkding.nebunebu.xyz".service = "http://127.0.0.1:9090";
            "n8n.nebunebu.xyz".service = "http://127.0.0.1:5678";
            "pinchflat.nebunebu.xyz".service = "http://127.0.0.1:8945";
            "qbittorrent.nebunebu.xyz".service = "http://127.0.0.1:8080";
            "verybad.wiki".service = "http://192.168.100.2:80";
            "www.verybad.wiki".service = "http://192.168.100.2:80";
          };
          default = "http_status:404";
        };
      };
    };
  };
}
