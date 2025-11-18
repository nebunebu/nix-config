{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.freecad;
in
{
  options.hm.freecad = {
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
