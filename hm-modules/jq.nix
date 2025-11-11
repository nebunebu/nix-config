{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.jq;
in
{
  options.neb.terminal.utilities.jq = {
    enable = lib.mkEnableOption "enable jq";
  };

  config = lib.mkIf cfg.enable {
    programs.jq = {
      enable = true;
    };
  };
}
