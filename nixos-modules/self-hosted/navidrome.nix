{ lib, config, ... }:

let
  cfg = config.serve.navidrome;
in
{
  options.serve.navidrome = {
    enable = lib.mkEnableOption "Enable navidrome";
  };

  config = lib.mkIf cfg.enable {
    services.navidrome = {
      enable = true;
      # environmentFile = ;
      openFirewall = true;
      settings = {
        Address = "0.0.0.0";
        MusicFolder = "/srv/music";
      };
    };
  };
}
