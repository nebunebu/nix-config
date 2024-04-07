{
  description = "nebu's NixOs configs";
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

      mkHost = { hostName, devicePath, configPath, extraModules ? [ ] }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs unstablePkgs; };
          modules = [
            inputs.disko.nixosModules.default
            (import ./disko.nix { device = devicePath; })
            configPath
          ] ++ extraModules ++ [
            {
              home-manager.users.nebu = import ./hosts/${hostName}/home.nix;
              home-manager.extraSpecialArgs = { inherit inputs pkgs unstablePkgs; };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        t5610 = mkHost {
          hostName = "t5610";
          devicePath = "/dev/sda";
          configPath = ./hosts/t5610/configuration.nix;
          # extraModules = [ ];
        };
        x230t = mkHost {
          hostName = "x230t";
          devicePath = "/dev/sda";
          configPath = ./hosts/x230t/configuration.nix;
        };
      };
    };
}
