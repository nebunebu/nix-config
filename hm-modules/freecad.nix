{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.desktop.freecad;
in
{
  options.desktop.freecad = {
    enable = lib.mkEnableOption "enable freecad";
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        freecad
        ;
    };
  };
}
