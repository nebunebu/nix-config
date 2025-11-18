{ lib, config, ... }:
let
  cfg = config.hm.jq;
in
{
  options.hm.jq = {
    enable = lib.mkEnableOption "enable jq";
  };

  config = lib.mkIf cfg.enable {
    programs.jq = {
      enable = true;
    };
  };
}
