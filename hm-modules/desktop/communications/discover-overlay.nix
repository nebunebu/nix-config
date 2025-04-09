{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.communications.discover-overlay;
in
{
  options.neb.desktop.communications.discover-overlay = {
    enable = lib.mkEnableOption "enable discover-overlay";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.discover-overlay
    ];
  };
}
