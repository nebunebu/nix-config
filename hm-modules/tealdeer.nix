{ lib, config, ... }:
let
  cfg = config.hm.tealdeer;
in
{
  options.hm.tealdeer = {
    enable = lib.mkEnableOption "enable tealdeer";
  };

  config = lib.mkIf cfg.enable {
    programs.tealdeer = {
      enable = true;
      settings = {
        display = {
          # compact = true;
        };
        update.auto_update = true;
      };
    };
  };
}
