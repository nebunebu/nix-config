{
  description = "nebu's NixOS configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    rosepine.url = "github:nebunebu/rosepine-flake";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

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
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
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

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
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
      masterPkgs = import inputs.nixpkgs-master {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [
          inputs.hyprpanel.overlay
          (_: prev: {
            manix = prev.manix.override (old: {
              rustPlatform = old.rustPlatform // {
                buildRustPackage =
                  args:
                  old.rustPlatform.buildRustPackage (
                    args
                    // {
                      version = "0.8.0-pr20";
                      src = prev.fetchFromGitHub {
                        owner = "nix-community";
                        repo = "manix";
                        rev = "c532d14b0b59d92c4fab156fc8acd0565a0836af";
                        sha256 = "sha256-Uo+4/be6rT0W8Z1dvCRXOANvoct6gJ4714flhyFzmKU=";
                      };
                      cargoHash = "sha256-FTrKdOuXTOqr7on4RzYl/UxgUJqh+Rk3KJXqsW0fuo0=";
                    }
                  );
              };
            });
          })
        ];
      };

      mkHost = import ./lib/mkHost.nix {
        inherit
          inputs
          masterPkgs
          system
          pkgs
          ;
      };
    in
    {
      nixosConfigurations = {
        iso = mkHost {
          hostName = "iso";
          disableHomeManager = true;
        };
        m715q = mkHost {
          hostName = "m715q";
          extraModules = [
            inputs.nixos-facter-modules.nixosModules.facter
            { config.facter.reportPath = ./hosts/m715q/nixOS/facter.json; }
            inputs.disko.nixosModules.disko
            # inputs.impermanence.nixosModules.impermanence
          ];
        };
        t5610 = mkHost { hostName = "t5610"; };
        x230t = mkHost {
          hostName = "x230t";
          extraModules = [ inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x230 ];
        };
      };

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
