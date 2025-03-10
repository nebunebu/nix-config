{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.cava;
in
{
  options.neb.terminal.utilities.cava = {
    enable = lib.mkEnableOption "enable cava";
  };

  config = lib.mkIf cfg.enable {
    programs.cava = {
      enable = true;
      settings = {
        general.framerate = 60;
        smoothing.noise_reduction = 88;
        color = {
          gradient = 1;
          gradient_count = 6;
          background = "'#191724'";
          gradient_color_1 = "'#31748f'";
          gradient_color_2 = "'#9ccfd8'";
          gradient_color_3 = "'#c4a7e7'";
          gradient_color_4 = "'#ebbcba'";
          gradient_color_5 = "'#f6c177'";
          gradient_color_6 = "'#eb6f92'";
        };
      };
    };
  };
}
