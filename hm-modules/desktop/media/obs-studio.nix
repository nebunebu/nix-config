{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.media.obs-studio;
in
{

  options = {
    neb.desktop.media.obs-studio.enable = lib.mkEnableOption "enable obs-studio";
  };

  config = lib.mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
}
