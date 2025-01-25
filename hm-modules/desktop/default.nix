{ lib
, config
, ...
}:
let
  cfg = config.neb.profile.desktop;
in
{
  imports = [
    ./browsers
    ./communications
    ./media
    ./productivity
    ./utilities
    ./window-managers
  ];

  options.neb.profile.desktop = {
    enable = lib.mkEnableOption "enable desktop profile";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop = {
      browsers.enable = true;
      communications.enable = true;
      media.enable = true;
      productivity.enable = true;
      utilities.enable = true;
      # window-managers.enable = true;
    };
  };
}
