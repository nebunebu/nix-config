{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.freshrss;
in
{

  options.neb.freshrss = {
    enable = lib.mkEnableOption "enable freshrss";
  };

  config = lib.mkIf cfg.enable {
    sops.secrets.freshrss = {
      owner = "freshrss";
      group = "freshrss";
      mode = "0400";
    };
    networking.firewall.allowedTCPPorts = [ 80 ];
    services.freshrss = {
      enable = true;
      authType = "form";
      baseUrl = "0.0.0.0";
      passwordFile = config.sops.secrets.freshrss.path;
      extensions = [
        pkgs.freshrss-extensions.youtube
        pkgs.freshrss-extensions.reading-time
        pkgs.freshrss-extensions.title-wrap
        pkgs.freshrss-extensions.reddit-image
        (pkgs.freshrss-extensions.buildFreshRssExtension {
          FreshRssExtUniqueId = "StarToPocket";
          pname = "star-to-pocket";
          version = "1.0";
          src = pkgs.fetchFromGitHub {
            owner = "huffstler";
            repo = "xExtension-StarToPocket";
            rev = "5ebea221243a2fff4f5c7af49d8f2c0f363c040f";
            hash = "sha256-vQWk0wKO4rAGERuFTtEJuRLmK7h2NVPtCXtNnqPu7EQ=";
          };
        })
        (pkgs.freshrss-extensions.buildFreshRssExtension {
          FreshRssExtUniqueId = "ClickableLinks";
          pname = "clickable-links";
          version = "1.01";
          src = pkgs.fetchFromGitHub {
            owner = "kapdap";
            repo = "freshrss-extensions";
            rev = "a44a25a6b8c7f298ac05b8db323bdea931e6e530";
            hash = "sha256-uWZi0sHdfDENJqjqTz5yoDZp3ViZahYI2OUgajdx4MQ=";
            sparseCheckout = [ "xExtension-ClickableLinks" ];
          };
        })
        (pkgs.freshrss-extensions.buildFreshRssExtension {
          FreshRssExtUniqueId = "YouTubeChannel2RssFeed";
          pname = "youtube-channel-2-rss-feed";
          version = "0.6.1";
          src = pkgs.fetchFromGitHub {
            owner = "cn-tools";
            repo = "cntools_FreshRssExtensions";
            rev = "878fb05675a90ddb8ab308b472ad2139d5725de8";
            # hash = "sha256-tKe2Ix+VE56p5zkjfsdU9AiRw3s4jDoJJufYXci6jdY=";
            hash = "sha256-WTtqMEYF/R6i60SAhwO4JOVf3tc/Qq7jtnUaeaJ4opQ=";
            sparseCheckout = [ "xExtension-YouTubeChannel2RssFeed" ];
          };
        })
        (pkgs.freshrss-extensions.buildFreshRssExtension {
          FreshRssExtUniqueId = "CustomCSS";
          pname = "custom-css";
          version = "0.6.1";
          src = pkgs.fetchFromGitHub {
            owner = "Siphalor";
            repo = "FreshRSS-Extensions";
            rev = "c2d7f195b68075116984a141a59cfeecff4c7ae1";
            hash = "sha256-HfZBzZxYv4zbgoBzViGm/KhrY1o7PVBeCNj80/inaw4=";
            sparseCheckout = [ "xExtension-CustomCSS" ];
          };
        })
        (pkgs.freshrss-extensions.buildFreshRssExtension {
          FreshRssExtUniqueId = "GReaderRedate";
          pname = "freshrss-greader-redate";
          version = "1.3";
          src = pkgs.fetchFromGitHub {
            owner = "javerous";
            repo = "freshrss-greader-redate";
            rev = "85ff8d0077df1e49b1ef74f273935f51525cb722";
            hash = "sha256-SKZlyeNQQFrNKIwnhx1SSVIeenmonQXyM92NgP/uRV0=";
            sparseCheckout = [ "xExtension-GReaderRedate" ];
          };
        })
      ];
    };
  };
}
