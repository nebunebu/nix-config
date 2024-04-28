{
  programs.yazi = {
    # FIX: Images not always in correct panel
    # FIX: Image remains when closed
    # FIX: Add nix-colors
    enable = true;
    enableZshIntegration = true;
    # keymap = {};
    # settings = {};
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
