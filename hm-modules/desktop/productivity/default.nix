{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.desktop.productivity;
in
{
  imports = [
    ./activitywatch.nix
  ];

  options.neb.desktop.productivity = {
    enable = lib.mkEnableOption "enable dektop productivity";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.productivity = {
      activitywatch.enable = false;
    };
  };
}
