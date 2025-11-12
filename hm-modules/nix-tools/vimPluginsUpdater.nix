{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.nix-tools.vimPluginsUpdater;
in
{
  options.opts.nix-tools.vimPluginsUpdater = {
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
