{ lib, config, ... }:
let
  cfg = config.hm.fs-tools.fd;
in
{
  options.hm.fs-tools.fd = {
    enable = lib.mkEnableOption "enable fd";
  };

  config = lib.mkIf cfg.enable {
    programs.fd = {
      enable = true;
      # extraOptions = [ ];
      # ignores = [];
    };
  };
}
