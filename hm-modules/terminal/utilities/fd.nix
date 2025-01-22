{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.fd;
in
{
  options.neb.terminal.utilities.fd = {
    enable = lib.mkEnableOption "enable fd";
  };

  config = lib.mkIf cfg.enable {
    programs.fd = {
      enable = true;
      # extraOptions = [ ];
      # ignores = [];
    };
  };
}
