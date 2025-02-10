{
  lib,
  config,
  ...
}:

let
  cfg = config.neb.terminal.shell.starship;
in
{

  options = {
    neb.terminal.shell.starship.enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          character =
            let
              nbsp = " ";
            in
            lib.mkForce {
              success_symbol = "[](bold green)${nbsp}";
              error_symbol = "[](bold red)${nbsp}";
              vimcmd_symbol = "[](bold yellow)";
              vimcmd_replace_one_symbol = "[](bold magenta)";
              vimcmd_replace_symbol = "[](bold cyan)";
              vimcmd_visual_symbol = "[](bold blue)";
            };
          aws = {
            disabled = true;
          };
        };
      };
    };
  };
}
