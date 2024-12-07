{ inputs, system, pkgs, ... }:

{
  # NOTE: run `nix develop` to update hooks
  # pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
  #   src = ./.;
  #   hooks = {
  #     nixpkgs-fmt.enable = false;
  #     deadnix = {
  #       enable = true;
  #       settings.noLambdaPatternNames = true;
  #     };
  #     nil.enable = false;
  #     statix.enable = false;
  #     # convco.enable = true;
  #   };
  # };
}
