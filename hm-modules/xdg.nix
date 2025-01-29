{ config, ... }:
{
  xdg = {
    enable = true;
    userDirs =
      let
        homeDir = config.home.homeDirectory;
      in
      {
        enable = true;
        createDirectories = true;
        desktop = null;
        documents = "${homeDir}/Documents";
        download = "${homeDir}/Downloads";
        extraConfig = {
          XDG_ARCHIVE_DIR = "${homeDir}/Archive";
          XDG_CLONES_DIR = "${homeDir}/Projects/Clones";
          XDG_PROJECTS_DIR = "${homeDir}/Projects";
          XDG_REPOMIX_DIR = "${homeDir}/Documes/Repomix";
          XDG_SCREENSHOTS_DIR = "${homeDir}/Media/Screenshots";
          XDG_WIKIS_DIR = "${homeDir}/Documents/Wikis";
        };
        music = "${homeDir}/Media/Music";
        pictures = "${homeDir}/Media/Pictures";
        publicShare = "${homeDir}/Share";
        templates = "${homeDir}/Projects/Templates";
        videos = "${homeDir}/Media/Videos";
      };

    mimeApps = {
      enable = true;
      defaultApplications = {
        # File browser
        "inode/directory" = "yazi.desktop";

        # Browser associations
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "text/html" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";

        # Discord and Etcher
        "x-scheme-handler/discord-1176718791388975124" = "discord-1176718791388975124.desktop";
        "x-scheme-handler/etcher" = "balena-etcher.desktop";

        # E-book
        "application/lrf" = "calibre-lrfviewer.desktop";

        # Video formats
        "video/mp4" = "mpv.desktop";
        "video/mpeg" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        "video/webm" = "mpv.desktop";

        # PDF and document formats
        "application/pdf" = "sioyek.desktop";
        "application/x-pdf" = "sioyek.desktop";
      };

      associations = {
        added = {
          # Browser associations
          "x-scheme-handler/http" = [ "firefox.desktop" ];
          "x-scheme-handler/https" = [ "firefox.desktop" ];
          "x-scheme-handler/chrome" = [ "firefox.desktop" ];
          "text/html" = [ "firefox.desktop" ];
          "application/x-extension-htm" = [ "firefox.desktop" ];
          "application/x-extension-html" = [ "firefox.desktop" ];
          "application/x-extension-shtml" = [ "firefox.desktop" ];
          "application/xhtml+xml" = [ "firefox.desktop" ];
          "application/x-extension-xhtml" = [ "firefox.desktop" ];
          "application/x-extension-xht" = [ "firefox.desktop" ];

          # Video formats
          "video/mp4" = [ "mpv.desktop" ];
          "video/mpeg" = [ "mpv.desktop" ];
          "video/x-matroska" = [ "mpv.desktop" ];
          "video/webm" = [ "mpv.desktop" ];

          # PDF and document formats
          "application/pdf" = [ "sioyek.desktop" ];
          "application/x-pdf" = [ "sioyek.desktop" ];
        };
        removed = { };
      };
    };
  };
}
