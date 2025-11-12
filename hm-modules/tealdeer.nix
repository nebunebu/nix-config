{ lib, config, ... }:
let
  cfg = config.opts.tealdeer;
in
{
  options.opts.tealdeer = {
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
