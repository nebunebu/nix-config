{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.terminal.utilities.lf;
in
{

  options = {
    neb.terminal.utilities.lf.enable = lib.mkEnableOption "enable lf";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ctpv
      file
      poppler_utils
      ffmpegthumbnailer
      atool
    ];
    programs.lf = {
      enable = true;
      commands = {
        # NOTE: cleaner not running correctly
        clearpreview = "\$${pkgs.ctpv}/bin/ctpvclear >/dev/null 2>&1";
      };
      keybindings = {
        c = "clearpreview";
      };
      previewer = {
        source = "${pkgs.ctpv}/bin/ctpv";
      };
      settings = {
        forcekitty = true;
        shell = "${pkgs.bash}/bin/bash";
        cleaner = "${pkgs.ctpv}/bin/ctpvclear";
      };
      extraConfig = ''
        cmd on-quit %${pkgs.ctpv}/bin/ctpv -e $id
      '';
    };
  };
}
