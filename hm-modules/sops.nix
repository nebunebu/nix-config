{ config, lib, ... }:
let
  cfg = config.hm.sops;
in
{
  options.hm.sops = {
    enable = lib.mkEnableOption "enable sops configuration";
  };

  config = lib.mkIf cfg.enable {
    sops = {
      defaultSopsFile = ../sops/secrets/secrets.yaml;
      age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    };
  };
}
