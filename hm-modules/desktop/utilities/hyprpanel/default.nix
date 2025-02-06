{
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.neb.desktop.hyprpanel;
  common = import ./common.nix;
  t5610 = import ./t5610.nix;
  x230t = import ./x230t.nix;
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  options = {
    neb.desktop.hyprpanel = {
      x230t.enable = lib.mkEnableOption "enable x230t hyprpanel setup";
      t5610.enable = lib.mkEnableOption "enable t5610 hyprpanel setup";
    };
  };

  config = lib.mkMerge [
    # t5610
    (lib.mkIf cfg.t5610.enable common)
    (lib.mkIf cfg.t5610.enable t5610)
    # x230t
    (lib.mkIf cfg.x230t.enable common)
    (lib.mkIf cfg.x230t.enable x230t)
  ];
}
