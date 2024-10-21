{ lib
, config
, pkgs
, ...
}:
let
  cfg = config.terminal.media.buku;
in
{
  options = {
    terminal.media.buku.enable = lib.mkEnableOption "enable buku";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ pkgs.buku ];

      sessionVariables = {
        BUKU_COLORS = "MCexm";
      };
    };
  };
}
