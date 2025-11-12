{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.libnotify;
in
{
  options.opts.libnotify = {
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
