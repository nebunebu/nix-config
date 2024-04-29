{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # programs.zsh.initExtra = /* bash */ ''
  #   direnv_load() {
  #     eval "$(direnv export bash)"
  #   }
  #   direnv_load &> /dev/null
  # '';
}
