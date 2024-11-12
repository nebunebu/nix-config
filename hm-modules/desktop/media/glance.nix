{ lib
, config
, unstablePkgs
, ...
}:
let
  cfg = config.neb.desktop.media.glance;
in
{

  options = {
    neb.desktop.media.glance.enable = lib.mkEnableOption "enable glance";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ unstablePkgs.glance ];

    wayland.windowManager.hyprland.settings.exec-once = [
      "${unstablePkgs.glance}/bin/glance --config ${config.xdg.configHome}/glance.yaml"
    ];

    xdg.configFile."glance.yml" = {
      target = "glance.yaml";
      text = /* yaml */ ''
        pages:
          - name: Home
            columns:
              - size: small
                widgets:
                  - type: calendar

                  - type: rss
                    limit: 10
                    collapse-after: 3
                    cache: 3h
                    feeds:
                      - url: https://ciechanow.ski/atom.xml
                      - url: https://www.joshwcomeau.com/rss.xml
                        title: Josh Comeau
                      - url: https://samwho.dev/rss.xml
                      - url: https://awesomekling.github.io/feed.xml
                      - url: https://ishadeed.com/feed.xml
                        title: Ahmad Shadeed

                  - type: twitch-channels
                    channels:
                      - theprimeagen
                      - cohhcarnage
                      - christitustech
                      - blurbs
                      - asmongold
                      - jembawls

              - size: full
                widgets:
                  - type: hacker-news

                  - type: videos
                    channels:
                      - UCR-DXc1voovS8nhAvccRZhg # Jeff Geerling
                      - UCv6J_jJa8GJqFwQNgNrMuww # ServeTheHome
                      - UCOk-gHyjcWZNj3Br4oxwh0A # Techno Tim

                  - type: reddit
                    subreddit: selfhosted

              - size: small
                widgets:
                  - type: weather
                    location: London, United Kingdom
      '';
    };
  };
}


