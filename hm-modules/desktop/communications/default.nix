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
    home.packages = [ pkgs.discover-overlay ];
    neb.desktop.communications = {
      # vesktop.enable = true;
      discord.enable = true;
      # discover-overlay = true;
    };
  };
}
