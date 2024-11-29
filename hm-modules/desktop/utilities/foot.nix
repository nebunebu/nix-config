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
        settings = {
          main = {
            font = lib.mkForce "IBM Plex Mono:size=11";
          };
          mouse = {
            hide-when-typing = lib.mkForce "yes";
          };
          cursor = {
            # style = lib.mkForce "beam";
          };
        };
      };
    };
  };
}
