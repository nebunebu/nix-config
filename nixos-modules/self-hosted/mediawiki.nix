{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.nos.self-hosted.mediawiki;
in
{
  options.nos.self-hosted.mediawiki = {
    enable = lib.mkEnableOption "enable mediawiki";
  };

  config = lib.mkIf cfg.enable {

    sops.secrets.wiki-vbw = {
      mode = "0444";
    };

    networking.firewall.allowedTCPPorts = [
      80
      81
      82
    ];

    containers.wiki-vbw = {
      autoStart = true;
      privateNetwork = true;
      hostAddress = "192.168.100.1";
      localAddress = "192.168.100.2";

      bindMounts."wiki-secret" = {
        hostPath = config.sops.secrets.wiki-vbw.path;
        mountPoint = "/run/secrets/wiki-vbw";
        isReadOnly = true;
      };

      config =
        { _, pkgs, ... }:
        {

          systemd.services.mediawiki-jobrunner = {
            description = "MediaWiki Job Runner";
            after = [
              "mediawiki-init.service"
              "mysql.service"
              "run-secrets-wiki\\x2dvbw.mount"
            ];
            requires = [ "run-secrets-wiki\\x2dvbw.mount" ];
            wantedBy = [ "multi-user.target" ];
            serviceConfig = {
              Type = "simple";
              User = "root";
              Environment = "MEDIAWIKI_PASSWORD_FILE=/run/secrets/wiki-vbw";
              ExecStart = "/run/current-system/sw/bin/mediawiki-run runJobs --wait";
              Restart = "always";
              RestartSec = "5s";
            };
          };

          networking.firewall.allowedTCPPorts = [ 80 ];

          services.phpfpm.pools.mediawiki.phpOptions = ''
            upload_max_filesize = 200M
            post_max_size = 200M
          '';

          services.mediawiki = {
            enable = true;
            name = "Very Bad Wiki";
            passwordFile = "/run/secrets/wiki-vbw";
            extraConfig = ''
              $wgArticlePath = "/vbw/$1";
              $wgCargoDefaultQueryLimit = 500;
              $wgFileExtensions[] = 'otf';
              $wgFileExtensions[] = 'svg';
              $wgFileExtensions[] = 'woff2';
              $wgFileExtensions[] = 'mp3';
              $wgJobRunRate = 0;
              $wgLogos = [
                'svg' =>  "/images/0/09/Vbw-logo.svg",
                'icon' => "/images/c/cb/Vbw-logo-1x.png",
              ];
              $wgMaxUploadSize = 200 * 1024 * 1024;
              $wgAllowCopyUploads = true;
              $wgScriptPath = "";
              $wgSitemapApiConfig['enabled'] = true;
              $wgSitemapNamespaces = [ NS_MAIN, NS_PROJECT ];
              $wgServer = "https://verybad.wiki";
              $wgShowExceptionDetails = true;
              $wgUploadDirectory = "/var/lib/mediawiki/uploads";
              $wgUploadPath = "/images";
              $wgUsePathInfo = true;
              $wgEmbedVideoUseEmbedStyleForLocalVideos = true;

              $wgDefaultSkin = 'citizen';
              $wgAllowSiteCSSOnRestrictedPages = true;
              $wgSkinsPreferred = [ 'citizen' ];
              $wgSkipSkins = [ 'monobook', 'vector', 'vector-2022', 'timeless' ]; // list skins to hide
              $wgDefaultMobileSkin = 'citizen';
              $wgCitizenThemeDefault = 'dark';
              $wgCitizenEnableCJKFonts = 'true';
              $wgCitizenHeaderPosition = 'top';
              $wgScribuntoEngineConf['luastandalone']['luaPath'] = '${pkgs.lua5_1}/bin/lua';
              $wgEmbedVideoRequireConsent = false;
            '';
            httpd.virtualHost = {
              hostName = "192.168.100.2";
              serverAliases = [ "verybad.wiki" ];
              adminAddr = "admin@localhost";
              extraConfig = ''
                LimitRequestBody 209715200
                RewriteEngine On
                RewriteRule ^/vbw/(.*)$ /index.php [L]
              '';
            };

            extensions = {
              AbuseFilter = null;
              CategoryTree = null;
              Cite = null;
              CodeEditor = null;
              DiscussionTools = null;
              Echo = null;
              InputBox = null;
              Linter = null;
              MultimediaViewer = null;
              ParserFunctions = null;
              PageImages = null;
              PdfHandler = null;
              ReplaceText = null;
              Scribunto = null;
              TemplateData = null;
              TemplateStyles = null;
              TextExtracts = null;
              VisualEditor = null;
              WikiEditor = null;

              Cargo = pkgs.fetchFromGitHub {
                owner = "wikimedia";
                repo = "mediawiki-extensions-Cargo";
                rev = "b4858cc31b59c7522e22f35c7c5ea1935ab4419d";
                hash = "sha256-4el/pyz0yo4uxt6DIUeQ5ClE/GdSYGYh0gtJwozijbE=";
              };

              EmbedVideo = pkgs.fetchFromGitHub {
                owner = "StarCitizenWiki";
                repo = "mediawiki-extensions-EmbedVideo";
                rev = "5e951df45b1ff95f72011a77a482a1a633c41197";
                hash = "sha256-Y2JNFuEp4uksKqzH5rnWs45bLKK1m0kwLnaeegvq5Ik=";
              };

              # Popups = pkgs.fetchFromGitHub {
              #   owner = "wikimedia";
              #   repo = "mediawiki-extensions-Popups";
              #   rev = "0c87541ff172405b4b3c683da726fe268c6d8f80";
              #   hash = "sha256-u70vTToMt8oIc52znzomWjNrFSIq4y0VBvkUj1cnF+c=";
              # };

              PortableInfobox = pkgs.fetchFromGitHub {
                owner = "Universal-Omega";
                repo = "PortableInfobox";
                rev = "3dbdf893652c7fa189cbb5a3f5f6fb27e3bd3b3d";
                hash = "sha256-KWTmxKNo5JxCkPPRbU6e+UyI7rG4UAeLsN/lg4Z9+R0=";
              };
            };

            skins = {
              Citizen = pkgs.fetchFromGitHub {
                owner = "StarCitizenTools";
                repo = "mediawiki-skins-Citizen";
                rev = "b42b65d440a232d675d8db61292e79a90bc9a61a";
                hash = "sha256-lePYgkAlU+MnmnzNlY+AYmYV1sTyrTtT6N2hRPpLrGE=";
              };
            };
          };
        };
    };
  };
}
