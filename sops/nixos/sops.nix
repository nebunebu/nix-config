{ inputs
, pkgs
, lib
, config
, ...
}:

{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  options = {
    sops.enable = lib.mkEnableOption "enable sops";
  };

  config = lib.mkIf config.sops.enable {
    environment.systemPackages = [ pkgs.sops ];

    sops = {
      defaultSopsFile = ../secrets/secrets.yaml;
      age.keyFile = "/home/nebu/.config/sops/age/keys.txt";
    };
  };
}
