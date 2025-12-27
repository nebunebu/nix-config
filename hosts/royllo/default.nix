{
  inputs,
  system,
  pkgs,
  ...
}:
{
  royllo = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit
        inputs
        system
        ;
      inherit (inputs) self;
    };
    modules = [
      (inputs.self + "/hosts/royllo/nixos/default.nix")
      inputs.stylix.nixosModules.stylix
      inputs.sops-nix.nixosModules.sops
      inputs.nixos-facter-modules.nixosModules.facter
      { config.facter.reportPath = inputs.self + "/hosts/royllo/nixos/facter.json"; }
      {
        home-manager = {
          useGlobalPkgs = true;
          backupFileExtension = "backup";
          users = {
            nebu = import (inputs.self + "/hosts/royllo/hm/nebu.nix");
            acgp = import (inputs.self + "/hosts/royllo/hm/acgp.nix");
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
