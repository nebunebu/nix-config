{ lib, config, ... }:
let
  cfg = config.hm.fs-tools.eza;
in
{
  options.hm.fs-tools.eza = {
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
