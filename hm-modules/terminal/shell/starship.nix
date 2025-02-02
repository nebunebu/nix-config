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
          aws = {
            disabled = true;
          };
        };
      };
    };
  };
}
