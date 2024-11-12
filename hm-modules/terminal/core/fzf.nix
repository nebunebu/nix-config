{ lib
, config
, ...
}:
let
  cfg = config.neb.terminal.core.fzf;
in
{

  options = {
    neb.terminal.core.fzf.enable = lib.mkEnableOption "enable fzf";
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
