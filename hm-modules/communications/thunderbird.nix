{
  lib,
  config,
  ...
}:
let
  cfg = config.opts.communications.thunderbird;
in
{
  options.opts.communications.thunderbird = {
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
