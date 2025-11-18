{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.nix-tools.vimPluginsUpdater;
in
{
  options.hm.nix-tools.vimPluginsUpdater = {
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
