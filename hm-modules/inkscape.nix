{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.inkscape;
in
{
  options.hm.inkscape = {
    enable = lib.mkEnableOption "enable inkscape";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.inkscape-with-extensions
    ];
  };
}
