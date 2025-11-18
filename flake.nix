{
  description = "nebu's NixOS configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    rosepine.url = "github:nebunebu/rosepine-flake";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ai-tools = {
      url = "github:numtide/nix-ai-tools";
    };

    anki = {
      url = "github:nebunebu/anki-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    claude-desktop = {
      url = "github:k3d3/claude-desktop-linux-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        dgop.follows = "dgop";
      };
    };

    impermanence.url = "github:nix-community/impermanence";

    direnv-instant.url = "github:Mic92/direnv-instant";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";

    mango = {
      url = "github:DreamMaoMao/mango";
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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
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

      treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./nix/treefmt.nix;
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

      formatter.${system} = treefmtEval.config.build.wrapper;

      devShells = builtins.mapAttrs (system: pkgs: {
        default = import ./nix/shell.nix {
          inherit pkgs;
          checks = inputs.self.checks.${system};
        };
      }) inputs.nixpkgs.legacyPackages;
    };
}
