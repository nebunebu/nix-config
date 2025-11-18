{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.communications.vesktop;
in
{
  options.hm.communications.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.vesktop ];
  };
}
