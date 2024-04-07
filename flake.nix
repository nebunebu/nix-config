{
  description = "nebu's nix config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
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
  outputs = { nixpkgs, nixpkgs-unstable, ... } @inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        t5610 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs unstablePkgs; };
          modules = [
            ./hosts/t5610/configuration.nix
            inputs.disko.nixosModules.default
            (import ./hosts/t5610/disko.nix { device = "/dev/sda"; })
            {
              home-manager.users.nebu = import ./hosts/t5610/home.nix;
              home-manager.extraSpecialArgs = { inherit inputs pkgs unstablePkgs; };
            }
          ];
        };
        x230t = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs unstablePkgs; };
          modules = [
            ./hosts/t5610/configuration.nix
            inputs.disko.nixosModules.default
            (import ./hosts/x230t/disko.nix { device = "/dev/sda"; })
            {
              home-manager.users.nebu = import ./hosts/x230t/home.nix;
              home-manager.extraSpecialArgs = { inherit inputs pkgs unstablePkgs; };
            }
          ];
        };
      };
    };
}
