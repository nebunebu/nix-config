{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.hm.window-managers.hyprland;
in
{
  imports = [
    ./keybinds
    ./theme.nix
    # ./pyprland
    ./hyprpolkitagent.nix
    # ./hyprgrass.nix
    ./hyprpicker.nix
    ./t5610.nix
    ./x230t.nix
  ];

  options.hm.window-managers.hyprland.enable = lib.mkEnableOption "enable hyprland";

  config = lib.mkIf cfg.enable {
    home.packages = [
      # inputs.hyprwayland-scanner.packages."${pkgs.stdenv.hostPlatform.system}".default
      pkgs.wf-recorder
      pkgs.grim
      # pkgs.hyprpolkitagent
      pkgs.slurp
      pkgs.wev
      pkgs.cliphist
      # # Starts DankShell
      # exec-once = dms run
      #
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      HYPRLAND_TRACE = "1";
      AQ_TRACE = "1";
      AQ_DRM_DEVICES = "/dev/dri/card1";
    };

    wayland.windowManager.hyprland = {
      enable = true;
      # package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
      xwayland.enable = true;
      systemd = {
        enable = true;
        # variables = [ "-all" ];
      };

      extraConfig =
        # toml
        ''
          exec-once = hypr-start
          exec-once = tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"
          # debug:disable_logs = false
        '';

      settings = {

        windowrulev2 = lib.mkForce [
          "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Edit Current)$"
          "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Add)$"
          "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Anki)$"
          "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Import File)$"
          "float, size 90% 90%, center 1, title:(.*blob:https://canary.discord.com/.*)"
          "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Add-ons)$"
          "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Leech Toolkit.*)$"
          "float, size 90% 90%, center 1, title:(.*HyperTTS.*)"
          "float, size 90% 90%, center 1, title:(.*Browse.*)"
          "float, size 90% 90%, center 1, initialClass:^(electron)$, initialTitle:^(Open Files)$"
        ];

        dwindle = {
          preserve_split = true;
          force_split = 2;
        };

        misc = {
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
