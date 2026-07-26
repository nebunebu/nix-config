{
  lib,
  config,
  ...
}:

let
  cfg = config.hm.shell.starship;
in
{

  options = {
    hm.shell.starship.enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf cfg.enable {
    # Themed by hand below; stylix's target would fight the settings here.
    stylix.targets.starship.enable = false;

    programs = {
      starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          username = {
            show_always = true;
          };
          character =
            let
              nbsp = " ";
            in
            {
              success_symbol = "[](bold green)${nbsp}";
              error_symbol = "[](bold red)${nbsp}";
              vimcmd_symbol = "[](bold yellow) ";
              vimcmd_replace_one_symbol = "[](bold magenta) ";
              vimcmd_replace_symbol = "[](bold cyan) ";
              vimcmd_visual_symbol = "[](bold blue) ";
            };
          aws = {
            disabled = true;
          };
        };
      };
    };
  };
}
