{ lib
, config
, ...
}:
let
  cfg = config.neb.anki-sync;
in
{
  options.neb.anki-sync = {
    enable = lib.mkEnableOption "enable anki-sync";
  };

  config = lib.mkIf cfg.enable {
    services.anki-sync-server = {
      enable = true;
      # address = "::1"; # default
      # port = 27701; # default
      openFirewall = true;
      users = {
        nebu = {
          passwordFile = ;
            };
        };
      };
    };
  }
