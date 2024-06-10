{ lib, config, pkgs, ... }:
let
  cfg = config.programs.xournalpp;
in
{
  options.programs.xournalpp = {
    enable = lib.mkEnableOption "enable xournalpp program";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.xournalpp
      pkgs.gnome.adwaita-icon-theme
    ];
  };
}
