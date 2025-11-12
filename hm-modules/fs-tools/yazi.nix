{
  lib,
  config,
  ...
}:
let
  cfg = config.opts.fs-tools.yazi;
in
{

  options = {
    opts.fs-tools.yazi.enable = lib.mkEnableOption "enable yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        log = {
          enabled = false;
        };
        manager = {
          show_hidden = false;
        };
        preview = {
          max_width = 1920;
          max_height = 1080;
          image_filter = "triangel";
        };
      };
      theme = {
        filetype = {
          rules = [ ];
        };
      };
    };
  };
}
