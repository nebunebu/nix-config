{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.self-hosted.filewizard;
in
{
  options.nos.self-hosted.filewizard = {
    enable = lib.mkEnableOption "enable filewizard";
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 6969 ];

    systemd.tmpfiles.rules = [
      "d /var/lib/filewizard 0750 nobody nogroup -"
      "d /var/lib/filewizard/config 0750 nobody nogroup -"
      "d /var/lib/filewizard/uploads 0750 nobody nogroup -"
      "d /var/lib/filewizard/processed 0750 nobody nogroup -"
    ];

    virtualisation.oci-containers.containers.filewizard = {
      image = "loredcast/filewizard:latest";
      autoStart = true;
      autoRemoveOnStop = false;
      extraOptions = [ "--restart=unless-stopped" ];
      ports = [ "0.0.0.0:6969:8000" ];
      environment = {
        LOCAL_ONLY = "true";
        # SECRET_KEY = "changeme"; # set if using auth
        UPLOADS_DIR = "/app/uploads"; # inside the container
        PROCESSED_DIR = "/app/processed"; # inside the container
        OMP_NUM_THREADS = "1";
        DOWNLOAD_KOKORO_ON_STARTUP = "true";
      };

      volumes = [
        "/var/lib/filewizard/config:/app/config"
        "/var/lib/filewizard/uploads:/app/uploads"
        "/var/lib/filewizard/processed:/app/processed"
      ];
    };
  };
}
