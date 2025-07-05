{
  inputs,
  system,
  ...
}:
{
  iso = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit
        inputs
        system
        ;
      inherit (inputs) self;
    };
    modules = [
      (inputs.self + "/hosts/iso/nixos/default.nix")
      inputs.stylix.nixosModules.stylix
      inputs.sops-nix.nixosModules.sops
    ];
  };
}
