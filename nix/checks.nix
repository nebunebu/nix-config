{ inputs, ... }:
inputs.nixpkgs.legacyPackages
|> builtins.mapAttrs (
  system: pkgs:
  let
    treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs {
      imports = [ ./treefmt.nix ];
    };
  in
  {
    formatting = treefmtEval.config.build.check ../.;

    # NOTE: run `nix develop` to update hooks
    pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
      src = ./.;
      hooks = {
        treefmt = {
          enable = true;
          package = inputs.self.formatter.${system};
        };
        # convco.enable = false;
      };
    };
  }
)
