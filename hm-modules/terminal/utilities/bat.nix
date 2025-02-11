{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.bat;
in
{
  options.neb.terminal.utilities.bat = {
    enable = lib.mkEnableOption "enable bat";
  };

  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        # theme = "ansi";
        pager = "never";
        style = "plain";
      };
      # extraPackages = [];
    };
  };
}
