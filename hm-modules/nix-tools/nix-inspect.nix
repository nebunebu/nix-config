{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.nix-inspect;
in
{
  options.neb.terminal.utilities.nix-inspect = {
    enable = lib.mkEnableOption "enable nix-tools";
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
