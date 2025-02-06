{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.productivity.activitywatch;
in
{
  options = {
    neb.desktop.productivity.activitywatch.enable = lib.mkEnableOption "enable activitywatch";
  };

  config = lib.mkIf cfg.enable {
    # NOTE:
    # - aw-watcher-window wayland does no explictly support hyprland
    # - aw-watcher-web is broswer extension, needs to be added to
    #   firefox profile in configs
    # - aw-watcher-vim add to neovim config (not in nixpkgs)
    # - aw-watcher-mpv & aw-watcher-mpv logger not in nixpkgs
    # - aw-watcher-tmux not in nixpkgs, add to tmux
    # - aw-watcher-ask scheduled questions (not in nixpkgs)
    # - aw-watcher-anki (not in nixpkgs)
    # - aw-watcher-utilization (not in nixpkgs)
    # - aw-importer-wakatime (not sure if desired)
    # - aw-watcher-input
    # - aw-watcher-media-player
    # - could probably just write hyprland specific watcher
    # - prob easier to just set style with userstyles

    # aw-notify
    services.activitywatch = {
      enable = true;
      # package = ;
      # settings = {};
      watchers = {
        aw-watcher-afk = {
          package = pkgs.aw-watcher-afk;
          settings = {
            timeout = 300;
            poll_time = 2;
          };
        };
        aw-watcher-window = {
          package = pkgs.aw-watcher-window-wayland;
          settings = {
            poll_time = 1;
            exclude_title = true;
          };
        };
      };
    };
  };
}
