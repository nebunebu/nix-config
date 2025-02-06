{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.neb.desktop.media.follow;
in
{
  options.neb.desktop.media.follow = {
    enable = lib.mkEnableOption "enable follow";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.callPackage ../../../pkgs/follow.nix { })
    ];
  };
}
