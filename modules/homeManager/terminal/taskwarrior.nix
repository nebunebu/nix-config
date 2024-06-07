{ pkgs, ... }:
{
  home.packages = [ pkgs.taskwarrior-tui ];
  programs = {
    taskwarrior.enable = true;
    zsh.shellAliases = {
      tadd = "task add +capture";
      taskt = "taskwarrior-tui";
    };
  };
}
