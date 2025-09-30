{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.ollama;
in
{

  options.neb.ollama = {
    enable = lib.mkEnableOption "enable ollama";
  };

  config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = true;
      host = "0.0.0.0";
      loadModels = [
        "qwen2.5:7b"
        "dolphin-mixtral:8x7b"
      ];
      openFirewall = true;
    };
  };
}
