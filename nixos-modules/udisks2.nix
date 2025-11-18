{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.udisks2;
in
{
  options.nos.udisks2 = {
    enable = lib.mkEnableOption "enable udisks2";
  };

  config = lib.mkIf cfg.enable {
    services.udisks2 = {
      enable = true;
      mountOnMedia = true;
      # settings = {};
    };
  };
}
