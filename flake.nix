{
  description = "nebu's NixOS configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:aylur/ags";

    ghostty.url = "github:ghostty-org/ghostty";

    stylix = {
      # NOTE: set to 24.11 when released
      url = "github:danth/stylix/master";
      # url = "github:diniamo/stylix/fix-hyprland";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nebvim.url = "github:nebunebu/nebvim";

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tool-suites.url = "github:nebunebu/tool-suites";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      ref = "refs/tags/v0.46.2";
      # ref = "refs/tags/v0.45.0";
      # rev = "f642fb97df5c69267a03452533de383ff8023570"; # fix chromium crash, pre-aquamarine
      submodules = true;
    };

    hyprwayland-scanner = {
      url = "github:hyprwm/hyprwayland-scanner?ref=v0.3.10";
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
        config = { allowUnfree = true; };
        overlays = [
          inputs.tool-suites.overlays.default
        ];
      };
      unstablePkgs = import inputs.nixpkgs-unstable {
        inherit system;
        config = { allowUnfree = true; };
      };

      mkHost = import ./lib/mkHost.nix {
        inherit inputs system pkgs unstablePkgs;
      };
    in
    {
      nixosConfigurations = {
        t5610 = mkHost { hostName = "t5610"; };
        x230t = mkHost { hostName = "x230t"; };
      };

      checks = builtins.mapAttrs
        (system: pkgs: import ./nix/checks.nix { inherit inputs system pkgs; })
        inputs.nixpkgs.legacyPackages;

      devShells = builtins.mapAttrs
        (system: pkgs: {
          default = import ./nix/shell.nix {
            inherit pkgs;
            checks = inputs.self.checks.${system};
          };
        })
        inputs.nixpkgs.legacyPackages;

    };
}
