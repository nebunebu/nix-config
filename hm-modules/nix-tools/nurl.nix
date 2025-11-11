{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.nurl;
in
{
  options.neb.terminal.utilities.nurl = {
    enable = lib.mkEnableOption "enable nurl";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          nurl
          ;
      };
    };
  };
}
