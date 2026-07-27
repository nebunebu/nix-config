{ inputs, ... }:
inputs.nixpkgs.legacyPackages
|> inputs.nixpkgs.lib.getAttrs (import ./systems.nix).all
|> builtins.mapAttrs (
  system: pkgs:
  let
    treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs {
      imports = [ ./treefmt.nix ];
    };
  in
  {
    formatting = treefmtEval.config.build.check ../.;

    pre-commit-check = import ./pre-commit-hooks.nix { inherit inputs system; };
  }
)
