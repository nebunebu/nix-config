{
  description = "nebu's NixOS configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    ags.url = "github:aylur/ags";

    stylix = {
      # NOTE: set to 24.11 when released
      url = "github:danth/stylix/master";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nebvim.url = "github:nebunebu/nebvim";

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NOTE: Hyprland
    # {{{

    # Tag: v0.47.0, commits: 5777
    # built against:
    #  aquamarine 0.7.2
    #  hyprlang 0.6.0
    #  hyprutils 0.5.0
    #  hyprcursor 0.1.11
    #  hyprgraphics 0.1.1
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      ref = "refs/tags/v0.47.0";
      submodules = true;
    };

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    hyprwayland-scanner = {
      url = "github:hyprwm/hyprwayland-scanner";
      # url = "github:hyprwm/hyprwayland-scanner?ref=v0.4.4";
      # url = "github:hyprwm/hyprwayland-scanner?ref=v0.3.10";
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
                      cargoHash = "sha256-ey8nXMCFnDSlJl+2uYYFm1YrhJ+r0sq48qtCwhqI0mo=";
                    }
                  );
              };
            });
          })
        ];
      };
      unstablePkgs = import inputs.nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      mkHost = import ./lib/mkHost.nix {
        inherit
          inputs
          system
          pkgs
          unstablePkgs
          ;
      };
    in
    {
      nixosConfigurations = {
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
