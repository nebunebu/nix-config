{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.communications.discover-overlay;
in
{
  options.hm.communications.discover-overlay = {
    enable = lib.mkEnableOption "enable discover-overlay";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.discover-overlay ];
  };
}
