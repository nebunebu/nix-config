{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.nos.self-hosted.ollama;
in
{

  options.nos.self-hosted.ollama = {
    enable = lib.mkEnableOption "enable ollama";
  };

  config = lib.mkIf cfg.enable {

    networking.firewall.allowedTCPPorts = [ 11434 ];

    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      rocmOverrideGfx = "9.0.0";
      host = "0.0.0.0";

      environmentVariables = {
        HSA_ENABLE_SDMA = "0";
      };
      openFirewall = true;
    };
  };
}
