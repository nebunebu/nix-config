{ pkgs, ... }: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      jellyfin-mpv-shim
      ;
  };

  programs.mpv = {
    enable = true;
    scripts = builtins.attrValues {
      inherit
        (pkgs.mpvScripts)
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
      #
      # };
    };
  };
}
