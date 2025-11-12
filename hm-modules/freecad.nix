{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.freecad;
in
{
  options.opts.freecad = {
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
