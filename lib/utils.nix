{ lib, pkgs, ... }:

{
  isEven = n: n lib.mod 2 == 0;

  # fromYAML = file:
  #   let
  #     json = pkgs.runCommand "converted.json" { } ''
  #       ${lib.meta.getExe pkgs.yj} < ${file} > $out
  #     '';
  #   in
  #   builtins.fromJSON (builtins.readFile json);
  #
  # TODO: add
  # mkHost
  # mapSystems

  mkHost =
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
          ./hosts/${hostName}/nixOS/default.nix
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
                  users.nebu = import ./hosts/${hostName}/homeManager/default.nix;
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
    };
}
