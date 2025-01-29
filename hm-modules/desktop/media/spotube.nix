{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.media.spotube;
in
{
  options = {
    neb.desktop.media.spotube.enable = lib.mkEnableOption "enable spotube";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.callPackage ../../../pkgs/spotube.nix { })
    ];
  };
}
