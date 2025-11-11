{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.bottom;
in
{
  options.neb.terminal.utilities.bottom = {
    enable = lib.mkEnableOption "enable bottom";
  };

  config = lib.mkIf cfg.enable {
    programs.bottom = {
      enable = true;
      # settings = {};
    };
  };
}
