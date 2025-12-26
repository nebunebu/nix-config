{ lib, config, ... }:

let
  cfg = config.nos.invidious;
in
{
  options.nos.invidious = {
    enable = lib.mkEnableOption "Enable invidious";
  };

  config = lib.mkIf cfg.enable {
    services = {
      invidious = {
        enable = true;
        # database.createLocally = true;
        # extraSettingsFile = "";
        #   address = "0.0.0.0";
        #   port = "3013";
        #   settings = {
        #     settings = {
        #       db = {
        #         user = "invidious";
        #         dbname = "invidious";
        #       };
        #     };
        #   };
        # };
        # invidious-router = {
        #   enable = true;
        # };
      };
    };
  };
}
