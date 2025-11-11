{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.terminal.utilities.direnv;
in
{
  options.neb.terminal.utilities.direnv = {
    enable = lib.mkEnableOption "enable direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      # silent = true;
    };
  };
}
