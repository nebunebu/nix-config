{ lib, config, ... }:
let
  cfg = config.opts.fs-tools.fd;
in
{
  options.opts.fs-tools.fd = {
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
