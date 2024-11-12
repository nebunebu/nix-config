{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.bat;
in
{
  options.neb.terminal.utilities.bat = {
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
