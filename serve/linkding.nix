{ lib, config, ... }:
let
  cfg = config.neb.linkding;
in
{
  options.neb.linkding.enable = lib.mkEnableOption "enable linkding";

  config = lib.mkIf cfg.enable {
    virtualisation.podman.enable = true;

    virtualisation.oci-containers.containers.linkding = {
      image = "sissbruecker/linkding:latest";
      autoStart = true;
      autoRemoveOnStop = false;
      extraOptions = [ "--restart=unless-stopped" ];
      ports = [ "127.0.0.1:9090:9090" ];
      volumes = [ "/var/lib/linkding/data:/etc/linkding/data" ];
      environment = {
        LD_CSRF_TRUSTED_ORIGINS = "https://linkding.nebunebu.xyz";
        LD_ALLOWED_HOSTS = "linkding.nebunebu.xyz,localhost,127.0.0.1";
      };
    };

    systemd.tmpfiles.rules = [
      "z /var/lib/linkding/data 0755 1000 1000 -"
    ];
  };
}
