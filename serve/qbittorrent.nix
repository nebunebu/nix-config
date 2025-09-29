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
      # webuiPort = ;
      # torrentingPort = ;
      serverConfig = {
        LegalNotice.Accepted = true;
        Preferences = {
          WebUI = {
            Username = "nebu";
            Password_PBKDF2 = "@ByteArray(ARQ77eY1NUZaQsuDHbIMCA==:0WMRkYTUWVT9wVvdDtHAjU9b3b7uB8NR1Gur2hmQCvCDpm39Q+PsJRJPaCU51dEiz+dTzh8qbPsL8WkFljQYFQ==)";
          };
          General.Locale = "en";
        };
      };
      openFirewall = true;
    };
  };
}
