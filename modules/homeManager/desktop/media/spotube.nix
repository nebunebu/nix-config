{ lib, config, pkgs, ... }:
let
  cfg = config.desktop.media.spotube;
in
{
  options = {
    desktop.media.spotube.enable = lib.mkEnableOption "enable spotube";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.callPackage ../../../../pkgs/spotube.nix { })
    ];
  };
}
