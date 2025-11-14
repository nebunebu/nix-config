{ lib, config, ... }:

let
  cfg = config.neb.services.syncthing;
in
{
  options.neb.services.syncthing = {
    enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      guiAddress = "0.0.0.0:8384";
      tray = {
        enable = true;
      };
    };
  };
}
