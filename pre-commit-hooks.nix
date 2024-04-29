{ inputs, ... }:

{
  imports = [ inputs.pre-commit-hooks.flakeModule ];
  perSystem.pre-commit = {
    settings.hooks = {
      deadnix.enable = true;
      nil.enable = true;
      nixpkgs-fmt.enable = true;
      statix.enable = true;
    };
  };
}
