# { pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "DroidSansM Nerd Font";
      size = 12;
    };
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      copy_on_select = "yes";
    };
    shellIntegration.enableZshIntegration = true;
    # shellIntegration.mode = true;
    theme = "Rosé Pine";
  };
}
