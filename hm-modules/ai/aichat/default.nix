{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.ai.aichat;
in
{
  imports = [
    ./config.nix
    ./roles.nix
    ./theme.nix
  ];

  options.opts.ai.aichat = {
    enable = lib.mkEnableOption "enable aichat";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.aichat ];
  };
}
