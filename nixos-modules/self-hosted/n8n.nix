{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.self-hosted.n8n;
in
{
  options.nos.self-hosted.n8n = {
    enable = lib.mkEnableOption "enable n8n";
  };

  config = lib.mkIf cfg.enable {
    services.n8n = {
      enable = true;
      openFirewall = true;
    };
  };
}
