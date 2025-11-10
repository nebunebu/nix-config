{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.desktop.browsers;
in
{
  imports = [
    ./chromium.nix
    ./firefox.nix
  ];

  options.neb.desktop.browsers = {
    enable = lib.mkEnableOption "enable browsers";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.browsers = {
      chromium.enable = true;
      firefox.enable = true;
    };
  };
}
