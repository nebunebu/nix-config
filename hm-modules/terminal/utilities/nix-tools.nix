{ lib
, config
, pkgs
, unstablePkgs
, ...
}:
let
  cfg = config.neb.terminal.utilities.nix-tools;
in
{
  options.neb.terminal.utilities.nix-tools = {
    enable = lib.mkEnableOption "enable nix-tools";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          nixpkgs-fmt
          nix-init
          nurl
          statix
          vimPluginsUpdater
          ;
        inherit (unstablePkgs) nix-inspect nvd;
      };
    };

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      # silent = true;
    };
  };
}
