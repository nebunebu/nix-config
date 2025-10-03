{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.beaverhabits;
in
{
  options.neb.beaverhabits = {
    enable = lib.mkEnableOption "enable beaver habit tracker";
  };

  config = lib.mkIf cfg.enable {

    systemd.tmpfiles.rules = [
      "d /var/lib/beaverhabits 0750 nobody nogroup -"
    ];

    virtualisation.oci-containers.containers.beaverhabits = {
      image = "daya0576/beaverhabits:latest";
      autoStart = true;

      ports = [ "8081:8080" ];

      volumes = [
        "/var/lib/beaverhabits:/app/.user"
      ];

      user = "nobody:nogroup";

      environment = {
        HABITS_STORAGE = "USER_DISK";
        FIRST_DAY_OF_WEEK = "0";
        MAX_USER_COUNT = "1";
        ENABLE_IOS_STANDALONE = "false";
        INDEX_SHOW_HABIT_COUNT = "true";
        INDEX_SHOW_HABIT_STREAK = "true";
      };
    };
  };
}
