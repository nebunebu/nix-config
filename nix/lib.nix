{ inputs }:
let
  inherit (inputs) self;
  inherit (inputs.nixpkgs) lib;
in
{
  mkHost =
    {
      name,
      users ? { },
      facter ? true,
      extraModules ? [ ],
    }:
    lib.nixosSystem {
      specialArgs = { inherit inputs self; };
      modules = [
        ../hosts/${name}/nixos
        inputs.stylix.nixosModules.stylix
        inputs.sops-nix.nixosModules.sops
        { networking.hostName = name; }
      ]
      ++ lib.optionals facter [
        inputs.nixos-facter-modules.nixosModules.facter
        { facter.reportPath = ../hosts/${name}/nixos/facter.json; }
      ]
      ++ lib.optionals (users != { }) [
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            inherit users;
            extraSpecialArgs = { inherit inputs self; };
            sharedModules = [ inputs.sops-nix.homeManagerModules.sops ];
          };
        }
      ]
      ++ extraModules;
    };
}
