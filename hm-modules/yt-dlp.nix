{
  lib,
  config,
  ...
}:
let
  cfg = config.hm.yt-dlp;
in
{
  options.hm.yt-dlp = {
    enable = lib.mkEnableOption "enable yt-dlp";
  };

  config = lib.mkIf cfg.enable {
    programs.yt-dlp = {
      enable = true;
      settings = {
        embed-thumbnail = true;
        embed-chapters = true;
        embed-metadata = true;
        sponsorblock-remove = "sponsor,selfpromo";
        retries = 3;
        throttled-rate = "100k";
        extractor-args = "youtube:player_client=tv";
        format = "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best";
        # Don't use on bermeja
        cookies-from-browser = "firefox";
        output = "\"~/YTDLP/%(channel)s/Season %(upload_date>%Y)s/s%(upload_date>%Y)se%(upload_date>%m)s%(upload_date>%d)s - %(title)s (%(id)s).%(ext)s\"";
      };
    };
  };
}
