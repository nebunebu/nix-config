{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.nix-tools.nixpkgs-fmt;
in
{
  options.opts.nix-tools.nixpkgs-fmt = {
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
