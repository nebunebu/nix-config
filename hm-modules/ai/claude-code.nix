{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.ai.claude-code;
in
{
  options.hm.ai.claude-code = {
    enable = lib.mkEnableOption "enable claude-code";

  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.claude-code ];
  };
}
