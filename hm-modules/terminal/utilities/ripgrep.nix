{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.ripgrep;
in
{
  options.neb.terminal.utilities.ripgrep = {
    enable = lib.mkEnableOption "enable ripgrep";
  };

  config = lib.mkIf cfg.enable {
    programs.ripgrep = {
      enable = true;
      arguments = [ ];
    };
  };
}
