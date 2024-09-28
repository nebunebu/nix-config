{ lib, config, unstablePkgs, ... }:
let
  cfg = config.desktop.productivity.obsidian;
in
{
  options = {
    desktop.productivity.obsidian.enable = lib.mkEnableOption "enable obsidian";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ unstablePkgs.obsidian ];
  };
}
