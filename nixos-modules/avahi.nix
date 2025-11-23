{ config, lib, ... }:
let
  cfg = config.nos.avahi;
in
{
  options.nos.avahi = {
    enable = lib.mkEnableOption "enable avahi configuration";
  };

  config = lib.mkIf cfg.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
      };
    };
  };
}
