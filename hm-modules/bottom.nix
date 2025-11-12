{ lib, config, ... }:
let
  cfg = config.opts.bottom;
in
{
  options.opts.bottom = {
    enable = lib.mkEnableOption "enable bottom";
  };

  config = lib.mkIf cfg.enable {
    programs.bottom = {
      enable = true;
      # settings = {};
    };
  };
}
