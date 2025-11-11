{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.vimPluginsUpdater;
in
{
  options.neb.terminal.utilities.vimPluginsUpdater = {
    enable = lib.mkEnableOption "enable vimPluginsUpdater";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          vimPluginsUpdater
          ;
      };
    };
  };
}
