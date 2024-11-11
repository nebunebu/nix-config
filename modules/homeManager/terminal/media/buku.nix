{ lib
, config
, pkgs
, ...
}:
let
  cfg = config.neb.terminal.media.buku;
in
{
  options = {
    neb.terminal.media.buku.enable = lib.mkEnableOption "enable buku";
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
