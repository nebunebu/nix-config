{ lib, config, ... }:
let
  cfg = config.hm.web-browsers;
in
{
  imports = [
    ./chromium.nix
    ./firefox.nix
    ./firefoxpwa.nix
  ];

  options.hm.web-browsers = {
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
