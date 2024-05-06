{
  description = "nebu's NixOs configs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    pyprland.url = "github:hyprland-community/pyprland";
    nixvim.url = "github:nix-community/nixvim/nixos-23.11";
    nix-colors.url = "github:misterio77/nix-colors";
    niri.url = "github:sodiboo/niri-flake";

    xremap-flake.url = "github:xremap/nix-flake";

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: with inputs;
    # { self
    # , nixpkgs
    # , nixpkgs-unstable
    # , pre-commit-hooks
    # , ...
    # } @inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = nixpkgs-unstable.legacyPackages.${system};

      mkHost = { hostName, extraModules ? [ ], disableHomeManager ? false }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs unstablePkgs; };
          modules = [ ./hosts/${hostName}/nixOS/default.nix ]
            ++ extraModules ++
            (if disableHomeManager then [ ] else [
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.nebu = import ./hosts/${hostName}/homeManager/default.nix;
                  extraSpecialArgs = { inherit inputs pkgs unstablePkgs; };
                };
              }
            ]);
        };
    in
    {
      nixosConfigurations = {
        t5610 = mkHost { hostName = "t5610"; };
        x230t = mkHost { hostName = "x230t"; };
        nixISO = mkHost {
          hostName = "nixISO";
          disableHomeManager = true;
        };
      };

      checks = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixpkgs-fmt.enable = true;
            deadnix.enable = true;
            nil.enable = true;
            statix.enable = true;
            # trailing_whitespace_fixer.enable = true;
            convco.enable = true;
          };
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        name = "nix-config";
        packages = [ pkgs.convco ];
        inherit (self.checks.pre-commit-check) shellHook;
        buildInputs = self.checks.pre-commit-check.enabledPackages;
      };
    };
}
