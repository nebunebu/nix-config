{ lib, config, ... }:

let
  cfg = config.hm.services.syncthing;
in
{
  options.hm.services.syncthing = {
    enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
    };
  };
}
