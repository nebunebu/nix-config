{
  inputs,
  system,
  pkgs,
  ...
}:
{
  antillia = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit
        inputs
        system
        ;
      inherit (inputs) self;
    };
    modules = [
      (inputs.self + "/hosts/antillia/nixos/default.nix")
      inputs.stylix.nixosModules.stylix
      inputs.sops-nix.nixosModules.sops
      inputs.nixos-facter-modules.nixosModules.facter
      { config.facter.reportPath = inputs.self + "/hosts/antillia/nixos/facter.json"; }
      {
        home-manager = {
          useGlobalPkgs = true;
          backupFileExtension = "backup";
          users = {
            nebu = import (inputs.self + "/hosts/antillia/hm/default.nix");
          };
          extraSpecialArgs = {
            inherit
              inputs
              pkgs
              ;
            inherit (inputs) self;
          };
          sharedModules = [
            inputs.sops-nix.homeManagerModules.sops
            inputs.impermanence.homeManagerModules.impermanence
          ];
        };
      }
    ];
  };
}
