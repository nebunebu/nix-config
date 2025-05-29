{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.development.claude-code;
in
{
  options.neb.development.claude-code = {
    enable = lib.mkEnableOption "enable claude-code";

  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.claude-code ];
  };
}
