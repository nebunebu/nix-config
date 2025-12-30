{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.jellyfin-desktop;
in
{
  options.hm.jq = {
    enable = lib.mkEnableOption "enable jellyfin-desktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.jellyfin-desktop
    ];
  };
}
