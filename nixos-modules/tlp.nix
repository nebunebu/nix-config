{ config, lib, ... }:
let
  cfg = config.nos.tlp;
in
{
  options.nos.tlp = {
    enable = lib.mkEnableOption "enable TLP laptop power management";
  };

  config = lib.mkIf cfg.enable {
    services.tlp.enable = true;
    # power-profiles-daemon and TLP both manage the same power knobs.
    services.power-profiles-daemon.enable = lib.mkForce false;
  };
}
