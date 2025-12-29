{ lib, config, ... }:
let
  cfg = config.hm.web-browsers;
in
{
  imports = [
    ./chromium.nix
    ./firefox
    ./firefoxpwa.nix
  ];

  options.hm.web-browsers = {
    enable = lib.mkEnableOption "enable web-browsers";
  };

  config = lib.mkIf cfg.enable {
    hm.web-browsers = {
      chromium.enable = true;
      firefox.enable = true;
      firefoxpwa.enable = true;
    };
  };
}
