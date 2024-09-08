{ inputs, self, system, pkgs, unstablePkgs }:

{ hostName
, extraModules ? [ ]
, disableHomeManager ? false
,
}:
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit
      inputs
      system
      pkgs
      unstablePkgs
      ;
    inherit (inputs) self;
  };
  modules =
    [
      (self + "/hosts/${hostName}/nixOS/default.nix")
      inputs.stylix.nixosModules.stylix
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
              useUserPackages = true;
              users.nebu = import (self + "/hosts/${hostName}/homeManager/default.nix");
              extraSpecialArgs = {
                inherit
                  inputs
                  pkgs
                  unstablePkgs
                  ;
                inherit (inputs) self;
              };
            };
          }
        ]
    );
}
