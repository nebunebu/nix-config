{ lib, config, ... }:
let
  cfg = config.hm.fs-tools.bat;
in
{
  options.hm.fs-tools.bat = {
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
