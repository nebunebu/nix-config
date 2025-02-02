{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.television;
in
{
  options.neb.terminal.utilities.television = {
    enable = lib.mkEnableOption "enable television";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.television ];
  };
}
