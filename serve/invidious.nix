{ lib, config, ... }:

let
  cfg = config.serve.invidious;
in
{
  options.serve.invidious = {
    enable = lib.mkEnableOption "Enable invidious";
  };

  config = lib.mkIf cfg.enable {
    services = {
      invidious = {
        enable = true;
        # extraSettingsFile = "";
        address = "0.0.0.0";
        port = "3013";
        # settings = { };
      };
      # invidious-router = {
      #   enable = true;
      # };
    };
  };
}
