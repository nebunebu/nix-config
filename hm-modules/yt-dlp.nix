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
        convert-subs = "srt";
        cookies-from-browser = "firefox"; # Don't use on bermeja
        embed-chapters = true;
        embed-metadata = true;
        embed-subs = true;
        embed-thumbnail = true;
        extractor-args = "youtube:player_client=tv";
        format = "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best";
        output = "\"~/Videos/YTDLP/%(channel)s/Season %(upload_date>%Y)s/s%(upload_date>%Y)se%(upload_date>%m)s%(upload_date>%d)s - %(title)s (%(id)s).%(ext)s\"";
        retries = 3;
        sponsorblock-remove = "sponsor,selfpromo";
        sub-format = "srt/vtt/best";
        sub-langs = "en.*,-live_chat";
        throttled-rate = "100k";
        write-auto-subs = true;
        write-subs = true;
      };
    };
  };
}
