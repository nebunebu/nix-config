{
  projectRootFile = "flake.nix";

  programs = {
    nixfmt.enable = true;
    deadnix.enable = true;
    # statix.enable = true;
  };

  settings = {
    formatter.deadnix = {
      options = [ "--no-lambda-pattern-names" ];
    };
  };
}
