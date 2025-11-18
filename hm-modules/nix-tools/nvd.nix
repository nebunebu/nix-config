{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.nix-tools.nvd;
in
{
  options.hm.nix-tools.nvd = {
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
