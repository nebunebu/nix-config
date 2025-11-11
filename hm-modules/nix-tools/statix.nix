{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.statix;
in
{
  options.neb.terminal.utilities.statix = {
    enable = lib.mkEnableOption "enable statix";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          statix
          ;
      };
    };
  };
}
