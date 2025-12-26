{
  projectRootFile = "flake.nix";

  programs = {
    nixfmt.enable = false;
    deadnix.enable = false;
    # statix.enable = true;
  };

  settings = {
    formatter.deadnix = {
      options = [ "--no-lambda-pattern-names" ];
    };
  };
}
