{ lib, config, ... }:

let
  cfg = config.neb.qbittorrent;
in
{
  options.neb.qbittorrent = {
    enable = lib.mkEnableOption "Qbittorent";
  };

  config = lib.mkIf cfg.enable {
    services.qbittorrent = {
      enable = true;
      extraArgs = [ "--confirm-legal-notice" ];
      serverConfig = {
        LegalNotice.Accepted = true;
        Preferences = {
          WebUI = {
            Username = "nebu";
            Password_PBKDF2 = "@ByteArray(wjC3vvvP57soIdmWnf+xEw==:OQuug/YIzZd7Hpg2b5HXq2NrNB9yss0jU47qicoeO3Nlih60yvW/VdfX2xQuy0TSmB7+WBfiLWga+Cy7lsf6+w==)";
          };
          General.Locale = "en";
        };
      };
    };
  };
}
