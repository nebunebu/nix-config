{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.pup;
in
{
  options.neb.terminal.utilities.pup = {
    enable = lib.mkEnableOption "enable pup";
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        pup
        ;
    };
  };
}
