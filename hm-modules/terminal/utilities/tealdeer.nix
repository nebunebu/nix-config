{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.tealdeer;
in
{
  options.neb.terminal.utilities.tealdeer = {
    enable = lib.mkEnableOption "enable tealdeer";
  };

  config = lib.mkIf cfg.enable {
    programs.tealdeer = {
      enable = true;
      settings = {
        display = {
          compact = true;
        };
        update.auto_update = true;
      };
    };
  };
}
