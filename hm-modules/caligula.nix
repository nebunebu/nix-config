{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.caligula;
in
{
  options.opts.caligula = {
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
