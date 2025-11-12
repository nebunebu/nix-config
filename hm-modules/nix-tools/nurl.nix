{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.nix-tools.nurl;
in
{
  options.opts.nix-tools.nurl = {
    enable = lib.mkEnableOption "enable nurl";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit (pkgs)
          nurl
          ;
      };
    };
  };
}
