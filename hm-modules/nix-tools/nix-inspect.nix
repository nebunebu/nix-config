{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.nix-tools.nix-inspect;
in
{
  options.opts.nix-tools.nix-inspect = {
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
