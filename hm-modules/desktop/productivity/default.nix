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
    # ./super-productivity.nix
    # ./pomodoro-logger.nix
    ./obsidian.nix
    ./keycombiner.nix
    ./activitywatch.nix
  ];

  options.neb.desktop.productivity = {
    enable = lib.mkEnableOption "enable dektop productivity";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.productivity = {
      activitywatch.enable = false;
      keycombiner.enable = false;
      obsidian.enable = true;
    };
  };
}
