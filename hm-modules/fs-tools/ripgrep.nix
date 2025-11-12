{ lib, config, ... }:
let
  cfg = config.opts.fs-tools.ripgrep;
in
{
  options.opts.fs-tools.ripgrep = {
    enable = lib.mkEnableOption "enable ripgrep";
  };

  config = lib.mkIf cfg.enable {
    programs.ripgrep = {
      enable = true;
      arguments = [ ];
    };
  };
}
