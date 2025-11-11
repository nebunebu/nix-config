{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.nixpkgs-fmt;
in
{
  options.neb.terminal.utilities.nixpkgs-fmt = {
    enable = lib.mkEnableOption "enable nix-tools";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          nixpkgs-fmt
          ;
      };
    };
  };
}
