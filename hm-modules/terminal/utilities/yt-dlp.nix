{ lib, config, unstablePkgs, ... }:
let
  cfg = config.neb.terminal.utilities.yt-dlp;
in
{
  options.neb.terminal.utilities.yt-dlp = {
    enable = lib.mkEnableOption "enable yt-dlp";
  };

  config = lib.mkIf cfg.enable {
    programs.yt-dlp = {
      enable = true;
      package = unstablePkgs.yt-dlp;
      # extraConfig = '''';
      # settings = '''';
    };
  };
}
