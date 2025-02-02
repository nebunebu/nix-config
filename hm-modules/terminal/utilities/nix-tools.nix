{
  lib,
  config,
  pkgs,
  ...
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
          nurl
          statix
          vimPluginsUpdater
          nix-inspect
          nvd
          ;
      };
    };
  };
}
