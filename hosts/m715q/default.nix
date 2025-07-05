{
  inputs,
  system,
  pkgs,
  ...
}:
{
  m715q = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit
        inputs
        system
        ;
      inherit (inputs) self;
    };
    modules = [
      (inputs.self + "/hosts/m715q/nixos/default.nix")
      inputs.stylix.nixosModules.stylix
      inputs.sops-nix.nixosModules.sops
      inputs.nixos-facter-modules.nixosModules.facter
      { config.facter.reportPath = inputs.self + "/hosts/m715q/nixos/facter.json"; }
      inputs.disko.nixosModules.disko
      {
        home-manager = {
          useGlobalPkgs = true;
          backupFileExtension = "backup";
          users.nebu = import (inputs.self + "/hosts/m715q/hm/default.nix");
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
