{ lib
, config
, ...
}:
let
  cfg = config.neb.desktop.communication;
in
{
  imports = [
    ./vesktop.nix
    # ./element
    # ./telegram
    # something irc
  ];

  options.neb.profile.terminal = {
    enable = lib.mkEnableOption "enable communication profile";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.communication = {
      vesktop.enable = true;
    };
  };
}
