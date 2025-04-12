{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.neb.desktop.communications;
in
{
  imports = [
    # ./vesktop.nix
    ./discord.nix
    # ./discover-overlay.nix
    # ./element
    # ./telegram
    # something irc
  ];

  options.neb.desktop.communications = {
    enable = lib.mkEnableOption "enable communications profile";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
    pkgs.discover-overlay
    pkgs.discocss
    ];

    neb.desktop.communications = {
      discord.enable = true;
    };

    # programs.discocss = {
    #   enable = true;
    #   discordAlias = true;
    #   discordPackage = (pkgs.discord.overrideAttrs (_: rec {
    #   version = "0.0.90";
    #   src = pkgs.fetchurl {
    #     url = "https://stable.dl2.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
    #     hash = "sha256-mfQo71G4Z5ZwDroWiI2W5Db5isMxdx4Fw3b6X+4n7Fg=";
    #   };
    #   }));
    #   css = ''
    #     .theme-light {
    #       --background-primary: #f3f4f644;
    #       --background-primary-alt: #eeeff244;
    #       --background-secondary: #e5e7eb44;
    #       --background-secondary-alt: #d1d5db44;
    #       --background-tertiary: #dfe2e744;
    #     }
    #   '';
    # };

  };
}
