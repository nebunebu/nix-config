{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.neb.desktop.window-managers.hyprland;
in
{
  imports = [
    ./keybinds
    ./theme.nix
    ./plugins
    ./pyprland
    ./hypridle.nix
    ./hyprpolkitagent.nix
    # ./hyprlock.nix
    ./hyprgrass.nix
    ./hyprpicker.nix
    ./t5610.nix
    ./x230t.nix
    ./hyprpaper.nix
  ];

  options.neb.desktop.window-managers.hyprland.enable = lib.mkEnableOption "enable hyprland";

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.hyprwayland-scanner.packages."${pkgs.system}".default
      pkgs.wl-clipboard
      pkgs.wf-recorder
      pkgs.grim
      # pkgs.hyprpolkitagent
      pkgs.slurp
      pkgs.wev
      pkgs.cliphist
      (pkgs.writeShellScriptBin "hypr-start" ''
        ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store &
        ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store &
      '')
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      HYPRLAND_TRACE = "1";
      AQ_TRACE = "1";
      AQ_DRM_DEVICES = "/dev/dri/card1";
    };

    wayland.windowManager.hyprland = {
      enable = true;
      # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = [ "-all" ];
      };

      extraConfig = ''
        exec-once = hypr-start
        exec-once = tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"
      '';

      settings = {
        dwindle = {
          preserve_split = true;
          force_split = 2;
        };

        misc = {
          "disable_hyprland_logo" = "true";
          "disable_splash_rendering" = "true";
          "mouse_move_enables_dpms" = "true";
          "key_press_enables_dpms" = "false";
          "enable_swallow" = "true";
          "swallow_regex" = [ "kitty" ];
        };

        input = {
          "kb_layout" = "us";
          "kb_options" = "caps:escape";
          "follow_mouse" = "1";
        };
      };
    };
  };
}
