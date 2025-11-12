{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.pup;
in
{
  options.opts.pup = {
    enable = lib.mkEnableOption "enable pup";
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        pup
        ;
    };
  };
}
