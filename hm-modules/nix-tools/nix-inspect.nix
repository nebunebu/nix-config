{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.nix-tools.nix-inspect;
in
{
  options.hm.nix-tools.nix-inspect = {
    enable = lib.mkEnableOption "enable nix-inspect";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          nix-inspect
          ;
      };
    };
  };
}
