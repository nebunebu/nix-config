{ lib
, config
, pkgs
, ...
}:
let
  cfg = config.neb.terminal.media.pyradio;
in
{
  options = {
    neb.terminal.media.pyradio.enable = lib.mkEnableOption "enable pyradio";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pyradio ];

    xdg.configFile."pyradio/themes/rose-pine.pyradio.theme" =
      let
        theme = builtins.toFile (builtins.fetchurl {
          url = "https://codeberg.org/thairanaru/pyradio/raw/branch/master/themes/rose-pine.pyradio-theme";
          sha256 = "0hmyly8nzrgwcyk20rbglr632fm9bhzkr7nfbyns3g9qgznia3kc";
        });
      in
      theme;
  };
}
