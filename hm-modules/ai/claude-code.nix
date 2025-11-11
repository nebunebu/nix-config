{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.development.claude-code;
in
{
  options.development.claude-code = {
    enable = lib.mkEnableOption "enable claude-code";

  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.claude-code ];
  };
}
