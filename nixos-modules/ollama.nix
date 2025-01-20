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
    services.ollama = {
      enable = true;
      # acceleration = "rocm";
      host = "0.0.0.0";
      loadModels = [ "qwen2.5:7b" "dolphin-mixtral:8x7b" ];
      openFirewall = true;
      # rocmOverrideGfx = "9.0.0";
      # environmentVariables = {
      #   ROCR_VISIBLE_DEVICES = "0";
      #   ROC_ENABLE_PRE_VEGA = "1";
      #   GPU_MAX_HEAP_SIZE = "100%";
      #   GPU_USE_SYNC_OBJECTS = "1";
      #   HSA_OVERRIDE_GFX_VERSION = "9.0.0";
      #   HSA_ENABLE_SDMA = "0";
      # };
    };
  };
}
