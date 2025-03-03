{ config, ... }:
{
  sops = {
    defaultSopsFile = ../sops/secrets/secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
  };
}
