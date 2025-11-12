{ lib, config, ... }:
let
  cfg = config.opts.lazygit;
in
{
  options.opts.lazygit = {
    enable = lib.mkEnableOption "enable lazygit";
  };

  config = lib.mkIf cfg.enable {
    programs.lazygit.enable = true;
  };
}
