{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.eza;
in
{
  options.neb.terminal.utilities.eza = {
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
