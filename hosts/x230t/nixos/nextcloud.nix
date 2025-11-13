{ pkgs, ... }:

{
  services.nextcloud = {
    enable = true;

    package = pkgs.nextcloud29;
    hostName = "cloud.example.org";
    config = {
      dbtype = "pgsql";
    };
    # https = true; # with ACME below
    # package = pkgs.nextcloud29; # or current
    # database.createLocally = true;
    # database.type = "pgsql";
    # configureRedis = true;
    # maxUploadSize = "20480M"; # tweak for big files
    # phpOptions = {
    #   "opcache.interned_strings_buffer" = "16";
    # };
    extraAppsEnable = true; # collabora, contacts, calendar, etc.
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  # If you prefer Cloudflare Tunnel instead of opening 80/443:
  # services.cloudflared.tunnels."nextcloud" = {
  #   default = { ingress = [{ hostname = "cloud.example.org"; service = "https://127.0.0.1:443"; } { service = "http_status:404"; }]; };
  # };
}
