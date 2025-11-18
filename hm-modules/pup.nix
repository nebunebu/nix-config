{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.pup;
in
{
  options.hm.pup = {
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
