{
  projectRootFile = "flake.nix";

  programs = {
    nixfmt.enable = true;
    deadnix.enable = true;
    statix.enable = false; # Disabled: doesn't support pipe operators yet
  };

  settings = {
    formatter.deadnix = {
      options = [ "--no-lambda-pattern-names" ];
    };
  };
}
