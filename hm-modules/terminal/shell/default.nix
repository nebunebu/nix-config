{ lib
, config
, ...
}:
let
  cfg = config.neb.terminal.shell;
in
{
  imports = [
    ./fzf.nix
    ./tmux.nix
    ./zsh.nix
  ];

  options.neb.profile.terminal.shell = {
    enable = lib.mkEnableOption "enable shell profile";
  };

  config = lib.mkIf cfg.enable {
    neb.terminal = {
      fzf.enable = true;
      tmux.enable = true;
      zsh.enable = true;
    };
  };
}
