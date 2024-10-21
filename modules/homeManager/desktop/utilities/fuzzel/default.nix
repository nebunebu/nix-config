{ lib, config, ... }:
let
  cfg = config.desktop.utilities.fuzzel;
in
{
  imports = [
    # NOTE: a lot of scripts are broken in some way
    ./scripts/default.nix
  ];

  options.desktop.utilities.fuzzel.enable = lib.mkEnableOption "enable fuzzel";

  config = lib.mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          prompt = "󰁔";
          fuzzy = "yes";
          inner-pad = 10;
          icons-enabled = "no";
          layer = "top";
          exit-on-keyboard-focus-loss = "yes";
        };
        dmenu.mode = "text";
        border = {
          width = 2;
          radius = 10;
        };
        colors = { };
      };
    };
  };
}
