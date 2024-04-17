{ pkgs, unstablePkgs, ... }:

{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      comma
      nix-output-monitor
      nixpkgs-fmt
      nurl
      statix
      ;

    inherit (unstablePkgs)
      nix-inspect
      nh
      ;
  };

  home.sessionVariables = {
    FLAKE = "/home/nebu/.nix-config";
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    # silent = true;
  };
}
