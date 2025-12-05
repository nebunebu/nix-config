{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.pinta;
in
{
  options.hm.pinta = {
    enable = lib.mkEnableOption "enable pinta";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.pinta
    ];
  };
}
