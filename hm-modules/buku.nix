{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.buku;
in
{
  options = {
    opts.buku.enable = lib.mkEnableOption "enable buku";
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
