{ lib, config, ... }:
let
  cfg = config.neb.desktop.utilities.foot;
in
{
  options.neb.desktop.utilities.foot = {
    enable = lib.mkEnableOption "enable foot";
  };
  config = lib.mkIf cfg.enable {
    programs = {
      foot = {
        enable = true;
      };
    };
  };
}
