{ inputs
, lib
, config
, pkgs
, ...
}:
let
  cfg = config.neb.security.sops;
in
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  options.neb.security.sops = {
    enable = lib.mkEnableOption "enable hm sops";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.sops ];
    sops = {
      defaultSopsFile = ../secrets/secrets.yaml;
      age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    };
  };
}
