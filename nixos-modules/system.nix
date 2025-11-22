{ config, lib, ... }:
let
  cfg = config.nos.system;
in
{
  options.nos.system = {
    enable = lib.mkEnableOption "enable system configuration";
  };

  config = lib.mkIf cfg.enable {
    system.stateVersion = "23.11";
  };
}
