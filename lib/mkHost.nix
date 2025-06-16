{
  inputs,
  system,
  pkgs,
  masterPkgs,
}:

{
  hostName,
  extraModules ? [ ],
  disableHomeManager ? false,
}:
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit
      inputs
      system
      masterPkgs
      ;
    inherit (inputs) self;
  };
  modules =
    [
      (inputs.self + "/hosts/${hostName}/nixos/default.nix")
      inputs.stylix.nixosModules.stylix
      inputs.sops-nix.nixosModules.sops
    ]
    ++ extraModules
    ++ (
      if disableHomeManager then
        [ ]
      else
        [
          {
            home-manager = {
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              users.nebu = import (inputs.self + "/hosts/${hostName}/hm/default.nix");
              extraSpecialArgs = {
                inherit
                  inputs
                  pkgs
                  masterPkgs
                  ;
                inherit (inputs) self;
              };
              sharedModules = [
                inputs.sops-nix.homeManagerModules.sops
                inputs.impermanence.homeManagerModules.impermanence
              ];
            };
          }
        ]
    );
}
