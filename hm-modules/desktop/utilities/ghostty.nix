{ lib, config, inputs, pkgs, ... }:
let
  cfg = config.neb.desktop.utilities.ghostty;
in
{
  options.neb.desktop.utilities.ghostty = {
    enable = lib.mkEnableOption "enable ghostty";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.ghostty.packages.${pkgs.system}.default
    ];
  };
}
