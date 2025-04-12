{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.desktop.media;
in
{
  imports = [
    ./mpv.nix
    ./obs-studio.nix
    ./sioyek.nix
    ./spotube.nix
  ];

  options.neb.desktop.media = {
    enable = lib.mkEnableOption "enable desktop media";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.media = {
      mpv.enable = true;
      obs-studio.enable = true;
      sioyek.enable = true;
      spotube.enable = true;
    };
  };
}
