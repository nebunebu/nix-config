{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.nix-tools.nurl;
in
{
  options.hm.nix-tools.nurl = {
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
