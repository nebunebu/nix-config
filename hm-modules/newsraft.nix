{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.newsraft;
in
{
  options = {
    hm.newsraft.enable = lib.mkEnableOption "enable newsraft";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.newsraft
    ];
  };
}
