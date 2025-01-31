{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.dumbkan;
in
{
  options.neb.dumbkan = {
    enable = lib.mkEnableOption "enable dumbkan";
  };

  config = lib.mkIf cfg.enable {

    # systemd.tmpfiles.rules = [
    #   "d /var/lib/dumbkan 0750 nobody nogroup -"
    # ];

    virtualisation.oci-containers.containers.dumbkan = {
      image = "dumbwareio/dumbkan:latest";
      autoStart = true;

      ports = [ "8082:3000" ];
      # volumes = [ "/var/lib/beaverhabits:/app/.user" ];
      # user = "nobody:nogroup";
      # environment = {
      #   HABITS_STORAGE = "USER_DISK";
      #   FIRST_DAY_OF_WEEK = "0";
      #   MAX_USER_COUNT = "1";
      #   ENABLE_IOS_STANDALONE = "false";
      #   INDEX_SHOW_HABIT_COUNT = "true";
      # };
      # extraOptions = [ "--restart=unless-stopped" ];
    };

    # networking.firewall.allowedTCPPorts = [ 8080 ];
  };
}
