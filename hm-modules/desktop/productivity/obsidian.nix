{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.productivity.obsidian;
in
{
  options = {
    neb.desktop.productivity.obsidian.enable = lib.mkEnableOption "enable obsidian";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.obsidian ];
  };
}
