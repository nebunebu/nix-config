{ inputs, pkgs, ... }:

{
  # Used to find the project root
  projectRootFile = "flake.nix";

  programs = {
    nixfmt = {
      enable = true;
      package = pkgs.nixfmt-rfc-style;
    };

    deadnix = {
      enable = true;
      no-lambda-pattern-names = true;
    };

    statix.enable = true;
  };
}
