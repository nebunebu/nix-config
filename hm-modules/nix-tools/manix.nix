{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.manix;
in
{
  options.neb.terminal.utilities.manix = {
    enable = lib.mkEnableOption "enable manix";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.manix
    ];
    manual.json.enable = true;
  };
}
