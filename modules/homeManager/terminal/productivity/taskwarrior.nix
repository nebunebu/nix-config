{ lib
, config
, pkgs
, ...
}:
let
  cfg = config.terminal.productivity.taskwarrior;
in
{

  options = {
    terminal.productivity.taskwarrior.enable = lib.mkEnableOption "enable taskwarrior";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.taskwarrior-tui ];
    programs = {
      taskwarrior.enable = true;
      zsh.shellAliases = {
        tadd = "task add +capture";
        taskt = "taskwarrior-tui";
      };
    };
  };
}
