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
    ./follow.nix
    ./glance.nix
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
      follow.enable = false;
      # glance.enable = true;
      mpv.enable = true;
      obs-studio.enable = false;
      sioyek.enable = true;
      spotube.enable = false;
    };
  };
}
