{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.nix-tools.nixpkgs-fmt;
in
{
  options.hm.nix-tools.nixpkgs-fmt = {
    enable = lib.mkEnableOption "enable nixpkgs-fmt";
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
