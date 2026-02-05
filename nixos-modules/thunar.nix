{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.nos.thunar;
in
{
  options.nos.thunar = {
    enable = lib.mkEnableOption "enable thunar";
  };

  config = lib.mkIf cfg.enable {
    programs.thunar = {
      enable = true;
      plugins = [
        pkgs.thunar-archive-plugin
        pkgs.thunar-volman
        pkgs.thunar-media-tags-plugin
        pkgs.thunar-vcs-plugin
      ];
    };
  };
}
