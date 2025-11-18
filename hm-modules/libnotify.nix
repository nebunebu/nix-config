{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.libnotify;
in
{
  options.hm.libnotify = {
    enable = lib.mkEnableOption "enable libnotify";
  };

  config = lib.mkIf cfg.enable {
    home.packages = builtins.attrValues {
      inherit (pkgs)
        libnotify
        ;
    };
  };
}
