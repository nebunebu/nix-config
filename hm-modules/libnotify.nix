{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.utilities.libnotify;
in
{
  options.utilities.libnotify = {
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
