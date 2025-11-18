{ lib, config, ... }:
let
  cfg = config.hm.lazygit;
in
{
  options.hm.lazygit = {
    enable = lib.mkEnableOption "enable lazygit";
  };

  config = lib.mkIf cfg.enable {
    programs.lazygit.enable = true;
  };
}
