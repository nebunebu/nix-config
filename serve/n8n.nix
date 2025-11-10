{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.n8n;
in
{
  options.neb.n8n = {
    enable = lib.mkEnableOption "enable n8n";
  };

  config = lib.mkIf cfg.enable {
    services.n8n = {
      enable = true;
      openFirewall = true;
      # webhookUrl = "";
    };
  };
}
