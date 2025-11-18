{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.dumbkan;
in
{
  options.nos.dumbkan = {
    enable = lib.mkEnableOption "enable dumbkan";
  };

  config = lib.mkIf cfg.enable {

    systemd.tmpfiles.rules = [
      "d /var/lib/dumbkan 0750 nobody nogroup -"
    ];

    virtualisation.oci-containers.containers.dumbkan = {
      image = "dumbwareio/dumbkan:latest";
      autoStart = true;

      ports = [ "8082:3000" ];
      volumes = [ "/var/lib/dumbkan:/app/data" ];
    };
  };
}
