{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.aichat;
in
{
  imports = [
    ./config.nix
    ./roles.nix
    ./theme.nix
  ];

  options.neb.terminal.utilities.aichat = {
    enable = lib.mkEnableOption "enable aichat";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.aichat ];
  };
}
