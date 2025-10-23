{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
let
  cfg = config.desktop.bars.dms;
in
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  options.desktop.bars.dms = {
    enable = lib.mkEnableOption "enable Dank Material";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      # pkgs.material-design-icons
      pkgs.material-symbols
    ];

    programs.dankMaterialShell = {
      enable = true;
      # enableSystemd = true;
      # enableClipboard = true;
      # enableVPN = true;
      # enableBrightnessControl = true;
      # enableColorPicker = true;
      # enableDynamicTheming = true;
      # enableAudioWavelength = true;
      # enableCalendarEvents = true;
      # enableSystemSound = true;
      # plugins = {};
    };

    # wayland.windowManager.hyprland.settings.exec-once = [
    #   "${pkgs.ashell}/bin/ashell"
    # ];
  };
}
