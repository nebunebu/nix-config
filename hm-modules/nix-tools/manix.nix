{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.opts.nix-tools.manix;
in
{
  options.opts.nix-tools.manix = {
    enable = lib.mkEnableOption "enable manix";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.manix
    ];
    manual.json.enable = true;
  };
}
