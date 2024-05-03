{ pkgs, ... }:
{
  home.packages = [ pkgs.taskwarrior-tui ];
  programs.taskwarrior.enable = true;
}
