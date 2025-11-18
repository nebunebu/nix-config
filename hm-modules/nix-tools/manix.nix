{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.nix-tools.manix;
in
{
  options.hm.nix-tools.manix = {
    enable = lib.mkEnableOption "enable manix";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.manix
    ];
    manual.json.enable = true;
  };
}
