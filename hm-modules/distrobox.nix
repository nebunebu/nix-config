{ lib, config, ... }:
let
  cfg = config.opts.distrobox;
in
{
  options.opts.distrobox = {
    enable = lib.mkEnableOption "enable distrobox";
  };

  config = lib.mkIf cfg.enable {
    services.podman.enable = true;
    programs.distrobox = {
      enable = true;
    };
  };
}
