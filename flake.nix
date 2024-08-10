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

    swww = {
      url = "github:LGFae/swww";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixvim-flake = {
    #   url = "github:nebunebu/nixvim";
    # };
    #
    # my-nvim = {
    #   url = "github:nebunebu/my-nvim";
    # };
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
      with inputs;
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        unstablePkgs = nixpkgs-unstable.legacyPackages.${system};

        mkHost =
          { hostName
          , extraModules ? [ ]
          , disableHomeManager ? false
          ,
          }:
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit
                inputs
                self
                system
                pkgs
                unstablePkgs
                ;
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
                            self
                            pkgs
                            unstablePkgs
                            ;
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

        checks = {
          # NOTE: run `nix develop` to update hooks
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixpkgs-fmt.enable = false;
              deadnix = {
                enable = true;
                settings.noLambdaPatternNames = true;
              };
              nil.enable = false;
              statix.enable = false;
              # convco.enable = true;
            };
          };
        };

        devShells.${system}.default = pkgs.mkShell {
          name = "nix-config";
          packages = [
            pkgs.convco
            pkgs.nixfmt-rfc-style
            pkgs.deadnix
            pkgs.statix
          ];
          inherit (self.checks.pre-commit-check) shellHook;
          buildInputs = self.checks.pre-commit-check.enabledPackages;
        };
      };
}
