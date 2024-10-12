{ lib
, config
, pkgs
, unstablePkgs
, ...
}:
let
  cfg = config.terminal.utilities.nix-tools;
in
{
  options.terminal.utilities.nix-tools = {
    enable = lib.mkEnableOption "enable nix-tools";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          comma
          nix-output-monitor
          nixpkgs-fmt
          nix-init
          nurl
          statix
          vimPluginsUpdater
          ;

        inherit (unstablePkgs) nix-inspect nh nvd;
      };

      sessionVariables = {
        FLAKE = "/home/nebu/.nix-config"; # Should be isolated with nh
      };
    };

    programs = {
      nix-index = {
        enable = true;
        enableZshIntegration = true;
      };

      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
        # silent = true;
      };
    };
  };
}
