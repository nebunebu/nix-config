{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nos.cloudflared;
in
{
  options.nos.cloudflared = {
    enable = lib.mkEnableOption "cloudflared";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = [
      pkgs.cloudflared
    ];

    services.cloudflared = {
      enable = true;
      certificateFile = "/home/nebu/.cloudflared/cert.pem";
      tunnels = {
        "cbd1b808-d80c-4afc-bc94-8c0838deae3e" = {
          credentialsFile = "/home/nebu/.cloudflared/cbd1b808-d80c-4afc-bc94-8c0838deae3e.json";
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
          };
          default = "http_status:404";
        };
      };
    };
  };
}
