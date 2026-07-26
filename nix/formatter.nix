{ inputs, ... }:
inputs.nixpkgs.legacyPackages
|> inputs.nixpkgs.lib.getAttrs (import ./systems.nix).all
|> builtins.mapAttrs (
  _system: pkgs:
  let
    eval = inputs.treefmt-nix.lib.evalModule pkgs {
      imports = [ ./treefmt.nix ];
    };
  in
  eval.config.build.wrapper
)
