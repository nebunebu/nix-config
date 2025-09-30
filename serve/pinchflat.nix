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
      # secretsFile = "/run/secrets/pinchflat";
      openFirewall = true;
      selfhosted = true;
    };

    # ensure dir exists with right perms
    systemd.tmpfiles.rules = [
      "d /var/lib/pinchflat/extras/yt-dlp-configs 0750 pinchflat pinchflat -"
    ];

    # stage the file from /etc, then copy pre-start
    environment.etc."pinchflat/yt-dlp-base-config.txt".text = ''
      --extractor-args youtube:player-client=default,-tv_simply
    '';

    systemd.services.pinchflat.preStart = ''
      install -m0640 -o pinchflat -g pinchflat -D \
        /etc/pinchflat/yt-dlp-base-config.txt \
        /var/lib/pinchflat/extras/yt-dlp-configs/base-config.txt
    '';

  };
}
