{ lib, config, ... }:
let
  cfg = config.opts.fs-tools.eza;
in
{
  options.opts.fs-tools.eza = {
    enable = lib.mkEnableOption "enable eza";
  };

  config = lib.mkIf cfg.enable {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      colors = "auto";
      # extraOptions = [];
      git = true;
      icons = "auto";
    };
  };
}
