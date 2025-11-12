{
  lib,
  config,
  ...
}:
let
  cfg = config.opts.direnv;
in
{
  options.opts.direnv = {
    enable = lib.mkEnableOption "enable direnv";
  };

  # TODO: check if direnv-instant
  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      # silent = true;
    };
  };
}
