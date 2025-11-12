{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.nix-tools.nvd;
in
{
  options.opts.nix-tools.nvd = {
    enable = lib.mkEnableOption "enable nvd";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          nvd
          ;
      };
    };
  };
}
