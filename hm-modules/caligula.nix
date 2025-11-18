{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.caligula;
in
{
  options.hm.caligula = {
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
