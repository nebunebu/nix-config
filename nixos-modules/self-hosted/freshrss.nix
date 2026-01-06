{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.self-hosted.freshrss;
in
{

  options.nos.self-hosted.freshrss = {
    enable = lib.mkEnableOption "enable freshrss";
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 80 ];
    sops.secrets.freshrss = {
      owner = "freshrss";
      group = "freshrss";
      mode = "0400";
    };
    services.freshrss = {
      enable = true;
      # api.enable = true;
      authType = "none";
      baseUrl = "http://192.168.1.225";
      defaultUser = "admin";
      passwordFile = config.sops.secrets.freshrss.path;
      # database = {
      #   passFile = config.sops.secrets.freshrss.path;
      # };
    };
  };
}
