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
        settings = {
          enable_audio_bell = false;
          confirm_os_window_close = 0;
          copy_on_select = "yes";
          hide_window_decorations = "yes";
          cursor_shape = "beam";
          cursor_beam_thickness = "1.5";
          cursor_blink_interval = "0";
          shell_integration = "enabled";
          linux_display_server = "wayland";
        };
        shellIntegration = {
          enableZshIntegration = true;
          mode = "enabled";
        };
      };
      zsh.shellAliases = {
        kimg = "kitty +kitten icat";
      };
    };
  };
}
