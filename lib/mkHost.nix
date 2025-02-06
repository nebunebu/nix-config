{
  inputs,
  system,
  pkgs,
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
      ;
    inherit (inputs) self;
  };
  modules =
    [
      (inputs.self + "/hosts/${hostName}/nixOS/default.nix")
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
              users.nebu = import (inputs.self + "/hosts/${hostName}/homeManager/default.nix");
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
        ]
    );
}
