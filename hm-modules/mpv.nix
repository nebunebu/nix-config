{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.mpv;
in
{

  options = {
    opts.mpv.enable = lib.mkEnableOption "enable mpv";
  };

  config = lib.mkIf cfg.enable {

    home.packages = builtins.attrValues { inherit (pkgs) jellyfin-mpv-shim; };

    programs.mpv = {
      enable = true;
      scripts = builtins.attrValues {
        inherit (pkgs.mpvScripts)
          sponsorblock
          thumbfast
          mpv-webm
          uosc
          ;
      };

      bindings = {
        "j" = "seek -5";
        "k" = "cycle pause";
        "l" = "seek 5";
        "<" = "frame-back-step";
        ">" = "frame-step";
        "c" = "script-message-to crop start-crop soft";
        "C" = "script-message-to crop start-crop hard";
      };
      config = {
        osc = "no";
        osd-level = 0;
        border = "no";
        ytdl-format = "bestvideo[height<=720]+bestaudio/best[height<=720]";
        watch-later-directory = "~/.config/mpv/watch_later/";
      };
      scriptOpts = {
        webm = {
          output_directory = "~/Media/Clips/";
          output_format = "mp4";
          output_template = "%F-%S-%E";
          twopass = "no";
        };
        # uosc = {
        #   color =
        #     let
        #       foreground = "f6c177";
        #       foreground_text = "eb6f92";
        #       background = "191724";
        #       background_text = "908caa";
        #       curtain = "26233a";
        #       success = "31748f";
        #       error = "eb6f92";
        #       colors = "${foreground},${foreground_text},${background},${background_text},${curtain},${success},${error}";
        #     in
        #     colors;
        # };
      };
    };
  };
}
