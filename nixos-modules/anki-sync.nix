{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.anki-sync;
in
{
  options.neb.anki-sync = {
    enable = lib.mkEnableOption "enable anki-sync";
  };

  config = lib.mkIf cfg.enable {
    sops.secrets.anki-sync = { };
    services.anki-sync-server = {
      enable = true;
      address = "0.0.0.0";
      port = 27701;
      openFirewall = true;
      users = [
        {
          username = "nebu";
          passwordFile = config.sops.secrets.anki-sync.path;
        }
      ];
    };
  };
}
