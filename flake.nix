{
  description = "nebu's NixOS configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    rosepine.url = "github:nebunebu/rosepine-flake";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    gemini-cli.url = "github:rishabh5321/gemini-cli-flake";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nebvim = {
      url = "github:nebunebu/nebvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-sugar-candy-nix = {
      url = "github:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NOTE: Hyprland
    # {{{
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      ref = "refs/tags/v0.47.1";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprwayland-scanner = {
      url = "github:hyprwm/hyprwayland-scanner";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprgrass = {
      url = "github:horriblename/hyprgrass?ref=v0.7.0";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    pyprland = {
      url = "github:hyprland-community/pyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # }}}

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = (
        (import ./hosts/iso { inherit inputs system pkgs; })
        // (import ./hosts/m715q { inherit inputs system pkgs; })
        // (import ./hosts/t5610 { inherit inputs system pkgs; })
        // (import ./hosts/x230t { inherit inputs system pkgs; })
      );

      checks = builtins.mapAttrs (
        system: pkgs: import ./nix/checks.nix { inherit inputs system pkgs; }
      ) inputs.nixpkgs.legacyPackages;

      devShells = builtins.mapAttrs (system: pkgs: {
        default = import ./nix/shell.nix {
          inherit pkgs;
          checks = inputs.self.checks.${system};
        };
      }) inputs.nixpkgs.legacyPackages;
    };
}
