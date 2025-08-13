{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.neb.sops;
in
{
  options = {
    neb.sops.enable = lib.mkEnableOption "enable sops";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.sops ];

    sops = {
      defaultSopsFile = ./secrets/secrets.yaml;
      age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    };
  };
}
