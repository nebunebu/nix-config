{ lib, config, unstablePkgs, ... }:
let
  cfg = config.neb.desktop.productivity.anki;
in
{
  options = {
    neb.desktop.productivity.anki.enable = lib.mkEnableOption "enable anki";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ unstablePkgs.anki-bin ];
      sessionVariables = {
        ANKI_WAYLAND = 1;
      };
    };

  };
}
