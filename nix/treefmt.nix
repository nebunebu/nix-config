{
  projectRootFile = "flake.nix";

  programs = {
    nixfmt.enable = true;
    deadnix.enable = true;
    black.enable = true;
    shellcheck = {
      enable = true;
      excludes = [ ".envrc" ];
    };
    statix.enable = true;
    yamlfmt.enable = true;
  };

  settings = {
    formatter.deadnix = {
      options = [ "--no-lambda-pattern-names" ];
    };
  };
}
