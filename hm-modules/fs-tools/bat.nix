{ lib, config, ... }:
let
  cfg = config.opts.fs-tools.bat;
in
{
  options.opts.fs-tools.bat = {
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
