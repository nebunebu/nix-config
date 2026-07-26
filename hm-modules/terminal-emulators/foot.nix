{ lib, config, ... }:
let
  cfg = config.hm.terminal-emulators.foot;
in
{
  options.hm.terminal-emulators.foot = {
    enable = lib.mkEnableOption "enable foot";
  };
  config = lib.mkIf cfg.enable {
    # Themed by hand below; stylix's target would fight the settings here.
    stylix.targets.foot.enable = false;

    programs = {
      foot = {
        enable = true;
        settings = {
          main = {
            font = "IBM Plex Mono:size=11";
          };
          mouse = {
            hide-when-typing = "yes";
          };
          cursor = {
            # style = lib.mkForce "beam";
          };
        };
      };
    };
  };
}
