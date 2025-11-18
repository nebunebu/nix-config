{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.ai.aichat;
in
{
  imports = [
    ./config.nix
    ./roles.nix
    ./theme.nix
  ];

  options.hm.ai.aichat = {
    enable = lib.mkEnableOption "enable aichat";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.aichat ];
  };
}
