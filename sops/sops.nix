{ inputs
, pkgs
, lib
, config
, ...
}:
let
  cfg = config.neb.sops;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  options = {
    neb.sops.enable = lib.mkEnableOption "enable sops";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.sops ];

    sops = {
      defaultSopsFile = ./secrets/secrets.yaml;
      age.keyFile = "/home/nebu/.config/sops/age/keys.txt";
    };
  };
}
