{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.lazygit;
in
{
  options.neb.terminal.utilities.lazygit = {
    enable = lib.mkEnableOption "enable lazygit";
  };

  config = lib.mkIf cfg.enable {
    programs.lazygit.enable = true;
  };
}
