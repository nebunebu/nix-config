{
  lib,
  config,
  ...
}:
let
  cfg = config.opts.fzf;
in
{

  options = {
    opts.fzf.enable = lib.mkEnableOption "enable fzf";
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
