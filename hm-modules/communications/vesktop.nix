{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.communications.vesktop;
in
{
  options.opts.communications.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.vesktop ];
  };
}
