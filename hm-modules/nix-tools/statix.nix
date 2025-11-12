{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.nix-tools.statix;
in
{
  options.opts.nix-tools.statix = {
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
