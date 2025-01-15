{ inputs
, pkgs
, config
, lib
, ...
}:
let
  cfg = config.neb.desktop.ui.hyprpanel;
  # Probably need to inherit pkgs to these
  common = import ./common.nix;
  t5610 = import ./t5610.nix;
  x230t = import ./x230t.nix;
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  options = {
    neb.desktop.ui.hyprpanel = {
      x230t.enable = lib.mkEnableOption "enable x230t hyprpanel setup";
      t5610.enable = lib.mkEnableOption "enable t5610 hyprpanel setup";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.t5610.enable common // t5610)
    (lib.mkIf cfg.x230t.enable common // x230t)
  ];
}
