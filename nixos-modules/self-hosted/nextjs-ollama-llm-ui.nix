{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.nos.self-hosted.ollama-ui;
in
{

  options.nos.self-hosted.ollama-ui = {
    enable = lib.mkEnableOption "enable ollama ui";
  };

  config = lib.mkIf cfg.enable {
    services.open-webui = {
      enable = true;
      host = "0.0.0.0";
      port = 4001;
      openFirewall = true;
      environment = {
        OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
        WEBUI_AUTH = "False"; # remove if you want login
      };
    };
  };
}
