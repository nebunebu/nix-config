{ config, ... }:
{
  sops = {
    defaultSopsFile = ../sops/secrets/secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    # secrets = {
    #   tuir_client_id.path = "%r/tuir_client_id.txt";
    #   tuir_client_secret.path = "%r/tuir_client_secret.txt";
    # };
  };
  # systemd.user.services."${some-service}".Unit.After = [ "sops-nix.service" ];
}
