{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.nvd;
in
{
  options.neb.terminal.utilities.nvd = {
    enable = lib.mkEnableOption "enable nvd";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          nvd
          ;
      };
    };
  };
}
