{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.neb.cloudflared;
in
{
  options.neb.cloudflared = {
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
        # Glance
        "cbd1b808-d80c-4afc-bc94-8c0838deae3e" = {
          credentialsFile = "/home/nebu/.cloudflared/cbd1b808-d80c-4afc-bc94-8c0838deae3e.json";
          ingress = {
            "glance.nebunebu.xyz".service = "http://127.0.0.1:3000";
            "jellyfin.nebunebu.xyz".service = "http://127.0.0.1:8096";
          };
          default = "http_status:404";
        };
      };
    };
  };
}
