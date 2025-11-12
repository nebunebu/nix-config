{ lib, config, ... }:
let
  cfg = config.opts.jq;
in
{
  options.opts.jq = {
    enable = lib.mkEnableOption "enable jq";
  };

  config = lib.mkIf cfg.enable {
    programs.jq = {
      enable = true;
    };
  };
}
