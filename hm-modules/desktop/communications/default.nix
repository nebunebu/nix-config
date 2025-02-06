{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.desktop.communications;
in
{
  imports = [
    ./vesktop.nix
    # ./element
    # ./telegram
    # something irc
  ];

  options.neb.desktop.communications = {
    enable = lib.mkEnableOption "enable communications profile";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.communications = {
      vesktop.enable = true;
    };
  };
}
