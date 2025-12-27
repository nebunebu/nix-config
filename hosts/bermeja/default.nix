{
  inputs,
  system,
  pkgs,
  ...
}:
{
  bermeja = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit
        inputs
        system
        ;
      inherit (inputs) self;
    };
    modules = [
      (inputs.self + "/hosts/bermeja/nixos/default.nix")
      inputs.stylix.nixosModules.stylix
      inputs.sops-nix.nixosModules.sops
      inputs.nixos-facter-modules.nixosModules.facter
      { config.facter.reportPath = inputs.self + "/hosts/bermeja/nixos/facter.json"; }
      {
        home-manager = {
          useGlobalPkgs = true;
          backupFileExtension = "backup";
          users.nebu = import (inputs.self + "/users/nebu/hm.nix");
          extraSpecialArgs = {
            inherit
              inputs
              pkgs
              ;
            inherit (inputs) self;
          };
          sharedModules = [
            inputs.sops-nix.homeManagerModules.sops
          ];
        };
      }
    ];
  };
}
