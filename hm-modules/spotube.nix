{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.desktop.spotube;
in
{
  options.desktop.spotube = {
    enable = lib.mkEnableOption "enable spotube";
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        spotube
        ;
    };
  };
}
