{ config, unstablePkgs, ... }:
# let
#   c = config.colorScheme.palette;
#   # c-gray = "${c.base07}";
#   # c-red = c.base08}";
#   # c-yellow = "#${c.base09}";
#   c-lteal = "#${c.base0C}";
#   # c-purple = "0xff${c.base0D}";
# in
{
  # xdg.configFile."yazi/plugins/smart-enter.yazi/init.lua" = /* lua */ ''
  #   return {
  #   	entry = function()
  #   		local h = cx.active.current.hovered
  #   		ya.manager_emit(h and h.cha.is_dir and "enter" or "open", { hovered = true })
  #   	end,
  #   }
  # '';

  programs.yazi = {
    # FIX: Add nix-colors
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
      # opener = {
      #   edit = {
      #     run = "nvim $@";
      #   };
      #   play = { };
      #   open = { };
      # };
    };
    theme = {
      filetype = {
        rules = [
          # { fg = "${c-lteal}"; mime = "image/*"; }
          # { fg = "#F3D398"; mime = "video/*"; }
          # { fg = "#F3D398"; mime = "audio/*"; }
          # { fg = "#CD9EFC"; mime = "application/x-bzip"; }
        ];
      };
    };
  };
}
