{
  lib,
  config,
  ...
}:
let
  cfg = config.hm.fzf;
in
{

  options = {
    hm.fzf.enable = lib.mkEnableOption "enable fzf";
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
