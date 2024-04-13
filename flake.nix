{
  description = "nebu's NixOs configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    pyprland.url = "github:hyprland-community/pyprland";
    # rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nixvim.url = "github:nix-community/nixvim/nixos-23.11";
    nix-colors.url = "github:misterio77/nix-colors";
    niri.url = "github:sodiboo/niri-flake";
  };
  outputs = { nixpkgs, nixpkgs-unstable, ... } @inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = nixpkgs-unstable.legacyPackages.${system};

      mkHost = { hostName, configPath, extraModules ? [ ] }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs unstablePkgs; };
          modules = [
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
          configPath = ./hosts/t5610/configuration.nix;
        };
        x230t = mkHost {
          hostName = "x230t";
          configPath = ./hosts/x230t/configuration.nix;
        };
      };
    };
}
