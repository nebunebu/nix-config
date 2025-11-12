{ lib, config, ... }:
let
  cfg = config.opts.fs-tools.zoxide;
in
{
  options.opts.fs-tools.zoxide = {
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
