{
  description = "nebu's NixOS configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    swww = {
      url = "github:LGFae/swww";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
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

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      # rev = "918d8340afd652b011b937d29d5eea0be08467f5"; # v0.41.2
      # rev = "9e781040d9067c2711ec2e9f5b47b76ef70762b3"; # v0.41.1
      # rev = "cba1ade848feac44b2eda677503900639581c3f4"; # v0.41.0
      # rev = "fe7b748eb668136dd0558b7c8279bfcd7ab4d759"; # v0.39.1
      rev = "f642fb97df5c69267a03452533de383ff8023570"; # fix chromium crash, pre-aquamarine

      submodules = true;
    };

    tool-suites.url = "github:nebunebu/tool-suites";

    # hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    hyprwayland-scanner = {
      url = "github:hyprwm/hyprwayland-scanner?ref=v0.3.10";
    };

    hyprgrass = {
      url = "github:horriblename/hyprgrass?ref=v0.7.0";
      inputs.hyprland.follows = "hyprland";
      # ref = "v0.7.0";
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
      # pkgs = inputs.nixpkgs.legacyPackages.${system};
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.tool-suites.overlays.default
          # inputs.hyprpanel.overlay
        ];
      };
      unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${system};

      mkHost =
        { hostName
        , extraModules ? [ ]
        , disableHomeManager ? false
        ,
        }:
        inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              system
              pkgs
              unstablePkgs
              ;
            inherit (inputs) self;
          };
          modules =
            [
              ./hosts/${hostName}/nixOS/default.nix
              inputs.stylix.nixosModules.stylix
            ]
            ++ extraModules
            ++ (
              if disableHomeManager then
                [ ]
              else
                [
                  {
                    home-manager = {
                      useGlobalPkgs = true;
                      useUserPackages = true;
                      users.nebu = import ./hosts/${hostName}/homeManager/default.nix;
                      extraSpecialArgs = {
                        inherit
                          inputs
                          pkgs
                          unstablePkgs
                          ;
                        inherit (inputs) self;
                      };
                    };
                  }
                ]
            );
        };
    in
    {
      nixosConfigurations = {
        t5610 = mkHost { hostName = "t5610"; };
        x230t = mkHost { hostName = "x230t"; };
        g500s = mkHost { hostName = "g500s"; };
        nixISO = mkHost {
          hostName = "nixISO";
          disableHomeManager = true;
        };
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
