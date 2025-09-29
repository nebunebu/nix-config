{ lib, config, ... }:

let
  cfg = config.neb.pinchflat;
in
{
  options.neb.pinchflat = {
    enable = lib.mkEnableOption "Pinchflat YouTube downloader";
  };

  config = lib.mkIf cfg.enable {
    services.pinchflat = {
      enable = true;
      extraConfig = {
        YT_DLP_WORKER_CONCURRENCY = 1;
      };
      openFirewall = true;
      selfhosted = true;
    };
  };
}
