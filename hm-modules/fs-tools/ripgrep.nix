{ lib, config, ... }:
let
  cfg = config.hm.fs-tools.ripgrep;
in
{
  options.hm.fs-tools.ripgrep = {
    enable = lib.mkEnableOption "enable ripgrep";
  };

  config = lib.mkIf cfg.enable {
    programs.ripgrep = {
      enable = true;
      arguments = [ ];
    };
  };
}
