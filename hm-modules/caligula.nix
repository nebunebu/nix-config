{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.utilities.caligula;
in
{
  options.utilities.caligula = {
    enable = lib.mkEnableOption "enable cli-tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        caligula
        ;
    };
  };
}
