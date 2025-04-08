{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.neb.development.claude;
in
{
  options.neb.development.claude = {
    enable = lib.mkEnableOption "enable claude";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      # (pkgs.callPackage ../../pkgs/claude-code/package.nix { })
      pkgs.claude-code
    ];
  };
}
