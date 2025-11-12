{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.ai.claude-code;
in
{
  options.opts.ai.claude-code = {
    enable = lib.mkEnableOption "enable claude-code";

  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.claude-code ];
  };
}
