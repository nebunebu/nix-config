{ lib, config, unstablePkgs, ... }:
let
  cfg = config.neb.terminal.utilities.aichat;
in
{
  options.neb.terminal.utilities.aichat = {
    enable = lib.mkEnableOption "enable aichat";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ unstablePkgs.aichat ];
  };
}
