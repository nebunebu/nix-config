{
  description = "nebu's nix config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    nixvim.url = "github:nix-community/nixvim/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };
  outputs = { nixpkgs, ... } @inputs:
    {
      #test
      nixosConfigurations = {
        t5610 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/t5610/configuration.nix
            inputs.disko.nixosModules.default
            (import ./hosts/t5610/disko.nix { device = "/dev/sda"; })
          ];
        };
        x230t = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/x230t/configuration.nix
            inputs.disko.nixosModules.default
            (import ./hosts/x230t/disko.nix { device = "/dev/sda"; })
          ];
        };
      };
    };
}
