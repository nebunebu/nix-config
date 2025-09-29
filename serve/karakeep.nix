{
  lib,
  config,
  ...
}:

let
  cfg = config.neb.karakeep;
in
{
  options.neb.karakeep = {
    enable = lib.mkEnableOption "Pinchflat YouTube downloader";
  };

  config = lib.mkIf cfg.enable {
    services.karakeep = {
      enable = true;
      meilisearch.enable = true;
      browser = {
        enable = true;
      };
      extraEnvironment = {
        PORT = "1234";
        DISABLE_SIGNUPS = "true";
        DISABLE_NEW_RELEASE_CHECK = "true";
      };
      # environmentFile = "/var/lib/karakeep/secrets.env";
    };
  };
}
