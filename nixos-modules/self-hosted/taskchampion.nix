{ lib, config, ... }:
let
  cfg = config.nos.self-hosted.taskchampion;
in
{
  options.nos.self-hosted.taskchampion = {
    enable = lib.mkEnableOption "enable taskchampion sync server";
  };

  config = lib.mkIf cfg.enable {

    services.taskchampion-sync-server = {

      enable = true;
      port = 10222;
      openFirewall = true;
      user = "taskchampion";
      group = "taskchampion";
      dataDir = "/var/lib/taskchampion-sync-server";
      snapshot = {
        days = 14;
        versions = 100;
      };
    };
  };
}
