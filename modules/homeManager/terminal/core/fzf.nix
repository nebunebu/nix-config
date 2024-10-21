{ lib
, config
, ...
}:
let
  cfg = config.terminal.core.fzf;
in
{

  options = {
    terminal.core.fzf.enable = lib.mkEnableOption "enable fzf";
  };

  config = lib.mkIf cfg.enable
    {
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        tmux = {
          enableShellIntegration = true;
        };
      };
    };
}
