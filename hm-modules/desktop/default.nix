{ lib
, config
, ...
}:
let
  cfg = config.neb.desktop;
in
{
  imports = [
    ./browsers
    ./communication
    ./media
    ./productivity
    ./ui
    ./utilities
    ./window-managers
  ];

  options.neb.profile.desktop = {
    enable = lib.mkEnableOption "enable desktop profile";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop = {
      browsers.enable = true;
      communication.enable = true;
      media.enable = true;
      productivity.enable = true;
      utilities.enable = true;
    };
  };
}
