{ lib, config, ... }:
let
  cfg = config.hm.fs-tools.zoxide;
in
{
  options.hm.fs-tools.zoxide = {
    enable = lib.mkEnableOption "enable zoxide";
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      # options = [];
    };
  };
}
