{ unstablePkgs, ... }:
{
  programs.yazi = {
    # FIX: Images not always in correct panel
    # FIX: Image remains when closed
    # FIX: Add nix-colors
    enable = true;
    package = unstablePkgs.yazi-unwrapped;
    enableZshIntegration = true;
    # keymap = {};
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
      # opener = {
      #   edit = {};
      #   play = {};
      #   open = {};
      # };
    };
    theme = {
      filetype = {
        rules = [
          { fg = "#7AD9E5"; mime = "image/*"; }
          { fg = "#F3D398"; mime = "video/*"; }
          { fg = "#F3D398"; mime = "audio/*"; }
          { fg = "#CD9EFC"; mime = "application/x-bzip"; }
        ];
      };
    };
  };
}
