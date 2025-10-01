{
  name = "StartPage";
  hide-desktop-navigation = false;
  center-vertically = true;
  columns = [
    {
      size = "small";
      widgets = [
        {
          type = "clock";
          hour-format = "12h";
        }
      ];
    }
    {
      size = "full";
      widgets = [
        {
          type = "search";
          autofocus = false;
          search-engine = "google";
        }
        {
          type = "monitor";
          cache = "1m";
          title = "Services";
          sites = [
            {
              title = "Glance";
              url = "https://glance.nebunebu.xyz";
              icon = "sh:glance-light";
              same-tab = true;
            }
            # {
            #   title = "Syncthing";
            #   url = "http://localhost:8384";
            #   icon = "si:syncthing";
            #   same-tab = true;
            # }
            {
              title = "Jellyfin";
              url = "https://jellyfin.nebunebu.xyz";
              icon = "sh:jellyfin-light";
              same-tab = true;
            }
            {
              title = "Pinchflat";
              url = "https://pinchflat.nebunebu.xyz";
              icon = "di:pinchflat";
              alt-status-codes = [
                401
              ];
              same-tab = true;
            }
            {
              title = "13ft";
              url = "https://13ft.nebunebu.xyz";
              icon = "di:pinchflat";
              same-tab = true;
            }
            {
              title = "Linkding";
              url = "https://linkding.nebunebu.xyz";
              icon = "sh:linkding-light";
              same-tab = true;
            }
            {
              title = "Qbittorrent";
              url = "https://qbittorrent.nebunebu.xyz";
              icon = "sh:qbittorrent-light";
              same-tab = true;
            }
            # {
            #   title = "Syncthing";
            #   url = "http://localhost:8384";
            #   icon = "si:syncthing";
            #   same-tab = true;
            # }
            # {
            #   title = "FresshRSS";
            #   url = "http://192.168.1.177:80";
            #   icon = "si:rss";
            #   same-tab = true;
            # }
            # {
            #   title = "BeaverHabits";
            #   url = "http://192.168.1.177:8081";
            #   icon = "si:dbeaver";
            #   same-tab = true;
            # }
            # {
            #   title = "linkding";
            #   url = "http://192.168.1.177:9090";
            #   icon = "si:linkfire";
            #   same-tab = true;
            # }
            # {
            #   title = "DumbKan";
            #   url = "http://192.168.1.177:8082";
            #   icon = "si:pinboard";
            #   same-tab = true;
            # }
            # {
            #   title = "TaskChampion";
            #   url = "http://192.168.1.177:10222";
            #   icon = "si:codefactor";
            #   same-tab = true;
            # }
            # {
            #   title = "Ollama";
            #   url = "http:192.168.177:11434";
            #   icon = "si:ollama";
            #   same-tab = true;
            # }
          ];
        }
        {
          type = "bookmarks";
          title = "Quick Links";
          groups = [
            {
              title = "General";
              links = [
                {
                  title = "Gmail";
                  url = "https://mail.google.com/mail/u/0";
                  same-tab = true;
                }
                {
                  title = "Github";
                  url = "https://github.com";
                  same-tab = true;
                }
                {
                  title = "Blog";
                  url = "https://nebnebu.xyz";
                  same-tab = true;
                }
              ];
            }
            {
              title = "Entertainment";
              links = [
                {
                  title = "NYT Games";
                  url = "https://www.nytimes.com/crosswords";
                  same-tab = true;
                }
                {
                  title = "Lichess";
                  url = "https://www.lichess.org";
                  same-tab = true;
                }
                {
                  title = "Reddit";
                  url = "https://www.reddit.com";
                  same-tab = true;
                }
              ];
            }
            {
              title = "Other";
              links = [
                {
                  title = "GetPocket";
                  url = "https://www.getpocket.com/saves";
                  same-tab = true;
                }
                {
                  title = "ShortcutFoo";
                  url = "https://www.shortcutfoo.com/app";
                  same-tab = true;
                }
              ];
            }
          ];
        }
      ];
    }
  ];
}
