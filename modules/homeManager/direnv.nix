{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # programs.zsh.initExtra = /* bash */ ''
  #   flakify() {
  #     if [ ! -e flake.nix ]; then
  #       nix flake new -t github:nix-community/nix-direnv .
  #     elif [ ! -e .envrc ]; then
  #       echo "use flake" > .envrc
  #       direnv allow
  #     fi
  #     ${EDITOR:-vim} flake.nix
  #   }
  # '';
}
