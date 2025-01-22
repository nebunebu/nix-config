{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.zoxide;
in
{
  options.neb.terminal.utilities.zoxide = {
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
