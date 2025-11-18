{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.n8n;
in
{
  options.nos.n8n = {
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
