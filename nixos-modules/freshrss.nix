{ lib
, config
, ...
}:
let
  cfg = config.neb.freshrss;
in
{

  options.neb.freshrss = {
    enable = lib.mkEnableOption "enable freshrss";
  };

  config = lib.mkIf cfg.enable {
    sops.secrets.freshrss = {
      owner = "freshrss";
      group = "freshrss";
      mode = "0400";
    };
    networking.firewall.allowedTCPPorts = [ 8083 ];
    services.freshrss = {
      enable = true;
      authType = "form";
      baseUrl = "0.0.0.0";
      passwordFile = config.sops.secrets.freshrss.path;
      # extensions = [];
    };
  };
}
