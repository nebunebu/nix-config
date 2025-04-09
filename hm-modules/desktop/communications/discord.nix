{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.communications.discord;
in
{
  options.neb.desktop.communications.discord = {
    enable = lib.mkEnableOption "enable discord";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.discord.overrideAttrs (_: rec {
        version = "0.0.90";
        src = pkgs.fetchurl {
          url = "https://stable.dl2.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
          hash = "sha256-mfQo71G4Z5ZwDroWiI2W5Db5isMxdx4Fw3b6X+4n7Fg=";
        };
      }))
    ];
  };
}
