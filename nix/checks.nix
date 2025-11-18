{
  inputs,
  system,
  ...
}:

{
  # NOTE: run `nix develop` to update hooks
  pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
    src = ./.;
    hooks = {
      # Use treefmt for formatting
      treefmt = {
        enable = true;
        package = inputs.self.formatter.${system};
      };

      # Linting hooks
      statix.enable = true;

      # Disabled hooks
      nixpkgs-fmt.enable = false;
      deadnix.enable = false; # Handled by treefmt
      nil.enable = false;
      # convco.enable = false; # User wants to wait on this
    };
  };
}
