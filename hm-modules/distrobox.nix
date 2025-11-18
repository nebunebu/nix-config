{ lib, config, ... }:
let
  cfg = config.hm.distrobox;
in
{
  options.hm.distrobox = {
    enable = lib.mkEnableOption "enable distrobox";
  };

  config = lib.mkIf cfg.enable {
    services.podman.enable = true;
    programs.distrobox = {
      enable = true;
    };
  };
}
