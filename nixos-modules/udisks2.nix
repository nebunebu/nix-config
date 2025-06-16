{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.udisks2;
in
{
  options.neb.udisks2 = {
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
