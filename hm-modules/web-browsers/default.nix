{ lib, config, ... }:
let
  cfg = config.opts.web-browsers;
in
{
  imports = [
    ./chromium.nix
    ./firefox.nix
    ./firefoxpwa.nix
  ];

  options.opts.web-browsers = {
    enable = lib.mkEnableOption "enable web-browsers";
  };

  config = lib.mkIf cfg.enable {
    opts.web-browsers = {
      chromium.enable = true;
      firefox.enable = true;
      firefoxpwa.enable = true;
    };
  };
}
