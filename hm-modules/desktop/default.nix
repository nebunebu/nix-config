{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.profile.desktop;
in
{
  imports = [
    ./communications
    ./media
    ./utilities
  ];

  options.neb.profile.desktop = {
    enable = lib.mkEnableOption "enable desktop profile";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop = {
      communications.enable = true;
      media.enable = true;
      utilities.enable = true;
    };
  };
}
