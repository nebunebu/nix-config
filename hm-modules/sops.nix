{ config, ... }:
{
  sops = {
    defaultSopsFile = ../sops/secrets/secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    secrets.hm_test = {
      path = "%r/hm_test.txt";
    };
  };
  # systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
}
