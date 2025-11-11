{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.terminal.shell.fzf;
in
{

  options = {
    neb.terminal.shell.fzf.enable = lib.mkEnableOption "enable fzf";
  };

  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux = {
        enableShellIntegration = true;
      };
    };
  };
}
