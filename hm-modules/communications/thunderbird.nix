{
  lib,
  config,
  ...
}:
let
  cfg = config.desktop.communications.thunderbird;
in
{
  options.desktop.communications.thunderbird = {
    enable = lib.mkEnableOption "enable thunderbird";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      thunderbird = {
        enable = true;
        profiles = {
          default = {
            isDefault = true;
          };
        };
      };
    };
  };
}
