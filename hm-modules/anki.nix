{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.hm.anki;
in
{
  options.hm.anki = {
    enable = lib.mkEnableOption "enable anki";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "anki-bin" ''
        ANKI_WAYLAND=1 exec ${pkgs.anki-bin}/bin/anki "$@"
      '')
    ];
  };
}
