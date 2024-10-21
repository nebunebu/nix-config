{ lib, config, ... }:
let
  cfg = config.terminal.utilities.bat;
in
{
  options.terminal.utilities.bat = {
    enable = lib.mkEnableOption "enablt bat";
  };

  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        # theme = "ansi";
        style = "plain";
      };
      # extraPackages = [];
    };
  };
}
