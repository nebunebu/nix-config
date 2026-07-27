{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.nos.self-hosted.freshrss;
in
{

  options.nos.self-hosted.freshrss = {
    enable = lib.mkEnableOption "enable freshrss";
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 80 ];
    sops.secrets.freshrss = {
      owner = "freshrss";
      group = "freshrss";
      mode = "0400";
    };

    systemd.services.freshrss-config.postStart = ''
      config_file="/var/lib/freshrss/config.php"
      if [ -f "$config_file" ]; then
        tmp=$(mktemp -p /var/lib/freshrss)
        sed "s/'suppress_csp_warning' => false/'suppress_csp_warning' => true/" "$config_file" > "$tmp"
        mv "$tmp" "$config_file"
      fi
    '';

    services.freshrss = {
      enable = true;
      api.enable = true;
      authType = "form";
      baseUrl = "https://freshrss.nebunebu.xyz";
      defaultUser = "admin";
      passwordFile = config.sops.secrets.freshrss.path;
      extensions = [
        pkgs.freshrss-extensions.youtube
        pkgs.freshrss-extensions.title-wrap
        pkgs.freshrss-extensions.reddit-image
        pkgs.freshrss-extensions.reading-time
        (pkgs.freshrss-extensions.buildFreshRssExtension {
          FreshRssExtUniqueId = "Af_Readability";
          pname = "Af_Readability";
          version = "0.3";
          src = pkgs.fetchFromGitHub {
            owner = "Niehztog";
            repo = "freshrss-af-readability";
            rev = "c0867be4692fa7de3e3d4bb0b88ec5d2a2a7def1";
            hash = "sha256-y9+7kkzNRmOHNFVhv004ZVVnhoeVEvbDjLE2AGlztTE=";
          };
        })
      ];
    };
  };
}
