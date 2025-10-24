{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.neb.terminal.shell.zsh.completions;
in
{
  options = {
    neb.terminal.shell.zsh.completions.enable = lib.mkEnableOption "enable completions";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.completionInit = ''
      # nh completions
      ${builtins.readFile ./nh_completions.zsh}
      ${builtins.readFile ./dms_completions.zsh}
      # Add aichat completion to fpath
      fpath+=${
        pkgs.fetchFromGitHub {
          owner = "sigoden";
          repo = "aichat";
          rev = "v0.26.0";
          sha256 = "sha256-02v4nnQTKkX7ssZ2it7YfDtx6w/vVWG5crMhwdv3tmM=";
          sparseCheckout = [ "scripts/completions" ];
        }
      }/scripts/completions
    '';
  };
}
