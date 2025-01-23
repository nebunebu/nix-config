{ lib, config, unstablePkgs, ... }:
let
  cfg = config.neb.terminal.utilities.yt-dlp;
in
{
  options.neb.terminal.utilities.yt-dlp = {
    enable = lib.mkEnableOption "enable yt-dlp";
  };

  config = lib.mkIf cfg.enable {
    programs.yt-dlp = {
      enable = true;
      package = unstablePkgs.yt-dlp;
      settings = {
        embed-thumbnail = true;
        embed-chapters = true;
        embed-metadata = true;
        sponsorblock-remove = "sponsor,selfpromo";
        retries = 3;
        throttled-rate = "100k";
        extractor-args = "youtube:player_client=tv";
        format = "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best";
        cookies = "~/.cookies-youtube-com.txt";
        output = "\"~/YTDLP/%(channel)s/Season %(upload_date>%Y)s/s%(upload_date>%Y)se%(upload_date>%m)s%(upload_date>%d)s - %(title)s (%(id)s).%(ext)s\"";
      };
    };
  };
}
