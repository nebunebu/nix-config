{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.nix-tools.statix;
in
{
  options.hm.nix-tools.statix = {
    enable = lib.mkEnableOption "enable statix";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          statix
          ;
      };
    };
  };
}
