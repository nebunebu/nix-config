{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.pyradio;
in
{
  options = {
    opts.pyradio.enable = lib.mkEnableOption "enable pyradio";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pyradio ];

    xdg.configFile = {
      "pyradio/themes/rose-pine.pyradio-theme".text = builtins.readFile (
        builtins.fetchurl {
          url = "https://codeberg.org/thairanaru/pyradio/raw/branch/master/themes/rose-pine.pyradio-theme";
          sha256 = "0hmyly8nzrgwcyk20rbglr632fm9bhzkr7nfbyns3g9qgznia3kc";
        }
      );
      "pyradio/config".text = # config
        ''
          player = mpv,mplayer,vlc
          default_playlist = stations
          default_station = False
          enable_mouse = False
          recording_dir = /home/nebu/.pyradio-recordings
          resource_opener = auto
          enable_notifications = -1
          use_station_icon = False
          remove_station_icons = True
          connection_timeout = 10
          force_http = False
          theme = rose-pine
          use_transparency = False
          force_transparency = False
          calculated_color_factor = 0
          console_theme = dark
          confirm_station_delete = True
          confirm_playlist_reload = True
          auto_save_playlist = False
          remote_control_server_ip = localhost
          remote_control_server_port = 9998
          remote_control_server_auto_start = False
          xdg_compliant = True
          distro = NixOS
        '';
    };
  };
}
