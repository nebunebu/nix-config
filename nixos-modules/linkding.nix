{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.linkding;
in
{
  options.neb.linkding = {
    enable = lib.mkEnableOption "enable linkding";
  };

  config = lib.mkIf cfg.enable {
    systemd.tmpfiles.rules = [
      "d /var/lib/linkding 0750 nobody nogroup -"
    ];

    virtualisation.oci-containers.containers.linkding = {
      image = "sissbruecker/linkding:latest";
      autoStart = true;

      ports = [ "9090:9090" ];
      volumes = [ "/var/lib/linkding:/app/data" ];
      environment = {
        LD_SUPERUSER_NAME = "nebu";
        LD_SUPERUSER_PASSWORD = "password";
      };
    };
  };
}
