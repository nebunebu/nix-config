{ lib
, config
, ...
}:
let
  cfg = config.neb.ollama;
in
{

  options.neb.ollama = {
    enable = lib.mkEnableOption "enable ollama";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.rocmSupport = true;
    services.ollama = {
      enable = true;
      acceleration = "rocm";
      host = "0.0.0.0";
      loadModels = [ "qwen2.5:7b" "dolphin-mixtral:8x7b" ];
      openFirewall = true;
      rocmOverrideGfx = "9.0.0";
    };
  };
}
