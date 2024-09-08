{ unstablePkgs, ... }:
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
}
