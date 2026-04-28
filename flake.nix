{
  description = "nebu's NixOS configs";
  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    rosepine = {
      url = "github:nebunebu/rosepine-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noogle-search = {
      url = "github:argosnothing/noogle-search";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    nix-pia-vpn = {
      url = "github:rcambrj/nix-pia-vpn";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anki = {
      url = "github:nebunebu/anki-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        pre-commit-hooks.follows = "pre-commit-hooks";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    claude-desktop = {
      url = "github:k3d3/claude-desktop-linux-flake";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    statix = {
      url = "github:oppiliappan/statix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    direnv-instant = {
      url = "github:Mic92/direnv-instant";
      inputs = {
        treefmt-nix.follows = "treefmt-nix";
        flake-parts.follows = "flake-parts";
      };
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";

    mango = {
      url = "github:DreamMaoMao/mango";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    stylix = {
      url = "github:danth/stylix/master";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nebvim = {
      url = "github:nebunebu/nebvim";
      # inputs = {
      #   nixpkgs.follows = "nixpkgs";
      #   treefmt-nix.follows = "treefmt-nix";
      #   flake-utils.follows = "flake-utils";
      #   flake-parts.follows = "flake-parts";
      #   nightly.follows = "nightly";
      #   nixneovimplugins.follows = "nixneovimplugins";
      # };
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
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
    in
    {
      nixosConfigurations =
        (import ./hosts/tuanaki { inherit inputs system pkgs; })
        // (import ./hosts/bermeja { inherit inputs system pkgs; })
        // (import ./hosts/antillia { inherit inputs system pkgs; })
        // (import ./hosts/royllo { inherit inputs system pkgs; });

      # checks = import ./nix/checks.nix { inherit inputs; };
      formatter = import ./nix/formatter.nix { inherit inputs; };
      devShells = import ./nix/shell.nix { inherit inputs; };
      packages = import ./pkgs { inherit inputs; };
    };
}
