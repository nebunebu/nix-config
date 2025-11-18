{ lib, config, ... }:
let
  cfg = config.hm.bottom;
in
{
  options.hm.bottom = {
    enable = lib.mkEnableOption "enable bottom";
  };

  config = lib.mkIf cfg.enable {
    programs.bottom = {
      enable = true;
      # settings = {};
    };
  };
}
