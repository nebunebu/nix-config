{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.nos.sops;
in
{
  options.nos.sops.enable = lib.mkEnableOption "enable sops";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.sops ];

    sops = {
      defaultSopsFile = ./secrets/secrets.yaml;
      # age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
      age.keyFile = "/home/nebu/.config/sops/age/keys.txt";
    };
  };
}
