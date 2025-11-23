{ config, lib, ... }:
let
  cfg = config.nos.console;
in
{
  options.nos.console = {
    enable = lib.mkEnableOption "enable console configuration";
  };

  config = lib.mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "US/Eastern";
    services = {
      openssh.enable = true;
      xserver = {
        xkb = {
          layout = "us";
          options = "caps:swapescape";
        };
      };
    };
    console = {
      useXkbConfig = true;
      font = "Lat2-Terminus16";
    };
  };
}
