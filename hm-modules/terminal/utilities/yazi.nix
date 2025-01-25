{ lib
, config
, unstablePkgs
, ...
}:
let
  cfg = config.neb.terminal.utilities.yazi;
in
{

  options = {
    neb.terminal.utilities.yazi.enable = lib.mkEnableOption "enable yazi";
  };

  config = lib.mkIf cfg.enable
    {
      programs.yazi = {
        enable = true;
        package = unstablePkgs.yazi-unwrapped;
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
