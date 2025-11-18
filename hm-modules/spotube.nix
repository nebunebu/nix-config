{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.spotube;
in
{
  options = {
    hm.spotube = {
      enable = lib.mkEnableOption "enable spotube";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        spotube
        ;
    };
  };
}
