{
  lib,
  config,
  ...
}:
let
  cfg = config.hm.gpg;
in
{
  options.hm.gpg = {
    enable = lib.mkEnableOption "enable gpg";
  };

  config = lib.mkIf cfg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      defaultCacheTtl = 1800; # 30 minutes
      maxCacheTtl = 7200; # 2 hours
    };
  };
}
