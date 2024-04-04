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
      nixosConfigurations = {
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

# inputs = {
#   hardware.url = "github:nixos/nixos-hardware";

# hyprland.url = "github:hyprwm/Hyprland";
#   impermanence = {
#     url = "github:nix-community/impermanence";
#   };

#   hyprland.url = "github:hyprwm/Hyprland";
#   hyprland-plugins = {
#     url = "github:hyprwm/hyprland-plugins";
#     inputs.hyprland.follows = "hyprland";
#   };
#   pyprland.url = "github:hyprland-community/pyprland";
#   ags.url = "github:Aylur/ags";
#   prism.url = "github:IogaMaster/prism";
#   sops-nix.url = "github:Mic92/sops-nix";
#   sops-nix.inputs.nixpkgs.follows = "nixpkgs";
#   firefox-addons = {
#     url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
#     inputs.nixpkgs.follows = "nixpkgs";
#   };
# };
