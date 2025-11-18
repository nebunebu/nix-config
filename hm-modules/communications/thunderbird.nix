{
  lib,
  config,
  ...
}:
let
  cfg = config.hm.communications.thunderbird;
in
{
  options.hm.communications.thunderbird = {
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
