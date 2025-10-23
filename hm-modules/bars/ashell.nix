{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.desktop.bars.ashell;
in
{
  options.desktop.bars.ashell = {
    enable = lib.mkEnableOption "enable ashell";
  };

  config = lib.mkIf cfg.enable {
    programs.ashell = {
      enable = true;
      settings = {
        enable_esc_key = true;
        modules = {
          left = [
            "Workspaces"
            "Windowtitle"
            "KeyboardSubmap"
            "MediaPlayer"
          ];
          center = [ "Tray" ];
          right = [
            "SystemInfo"
            [
              "Clock"
              "Privacy"
              "Settings"
            ]
          ];
        };
        workspaces = {
          visibility_mode = "All";
          enable_workspace_filing = true;
          max_workspaces = 9;
          # workspace_names = [""];
        };
        # appearance = {
        #   font_name = "";
        # };
      };
      systemd.enable = true;
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "${pkgs.ashell}/bin/ashell"
    ];
  };
}
