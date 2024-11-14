{ lib, config, ... }:
let
  cfg = config.neb.desktop.utilities.kitty;
in

{
  options.neb.desktop.utilities.kitty = {
    enable = lib.mkEnableOption "enable kitty";
  };

  config = lib.mkIf cfg.enable {

    home.sessionVariables = {
      KITTY_DISABLE_WAYLAND = "0";
    };

    programs = {
      kitty = {
        enable = true;
        # font = {
        #   name = "DroidSansM Nerd Font";
        #   size = 12;
        # };
        settings = {
          enable_audio_bell = false;
          confirm_os_window_close = 0;
          copy_on_select = "yes";
          # linux_display_server = "wayland";
          hide_window_decorations = "yes";
        };
        shellIntegration.enableZshIntegration = true;
        # shellIntegration.mode = true;
        # theme = "Rosé Pine";
      };
      zsh.shellAliases = {
        kimg = "kitty +kitten icat";
      };
    };
  };
}
