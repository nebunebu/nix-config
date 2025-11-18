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
    opts.spotube = {
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
