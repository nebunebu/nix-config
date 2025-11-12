{ lib, config, ... }:

let
  cfg = config.opts.services.syncthing;
in
{
  options.opts.services.syncthing = {
    enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
    };
  };
}
