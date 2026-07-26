{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.hm.shell.zsh.completions;

  aichat = pkgs.fetchFromGitHub {
    owner = "sigoden";
    repo = "aichat";
    rev = "v0.26.0";
    sha256 = "sha256-02v4nnQTKkX7ssZ2it7YfDtx6w/vVWG5crMhwdv3tmM=";
    sparseCheckout = [ "scripts/completions" ];
  };
in
{
  options = {
    hm.shell.zsh.completions.enable = lib.mkEnableOption "extra zsh completions";
  };

  config = lib.mkIf (config.hm.shell.zsh.enable && cfg.enable) {
    # `completionInit` is a plain string that *replaces* home-manager's default
    # (`autoload -U compinit && compinit`) rather than merging with it, so the
    # default has to be restated here. Order matters: fpath additions first,
    # then compinit, then the compdef-based scripts, which need compinit loaded.
    programs.zsh.completionInit = ''
      # aichat
      fpath+=${aichat}/scripts/completions

      autoload -U compinit && compinit

      ${builtins.readFile ./nh_completions.zsh}
      ${builtins.readFile ./dms_completions.zsh}
    '';
  };
}
