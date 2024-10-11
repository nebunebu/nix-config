{ lib, config, ... }:
let
  cfg = config.terminal.bat;
in
{
  options.terminal.bat = {
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
