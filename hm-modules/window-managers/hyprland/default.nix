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
        windowrule = lib.mkForce [
          "float on, size 90% 90%, center on, match:title (.*blob:https://canary.discord.com/.*)"
          "float on, size 90% 90%, center on, match:initial_class ^(Discord)$, match:title (Save File)"
          "float on, size 90% 90%, center on, match:title (.*HyperTTS.*)"
          "float on, size 90% 90%, center on, match:title (.*Browse.*)"
          "float on, size 90% 90%, center on, match:initial_class ^(electron)$, match:initial_title ^(Open Files)$"

          "float on, size 90% 90%, center on, match:initial_class ^(anki)$, match:initial_title ^(Edit Current)$"
          "float on, size 90% 90%, center on, match:initial_class ^(anki)$, match:initial_title ^(Add)$"
          "float on, size 90% 90%, center on, match:initial_class ^(anki)$, match:initial_title ^(Anki)$"
          "float on, size 90% 90%, center on, match:initial_class ^(anki)$, match:initial_title ^(Import File)$"
          "float on, size 90% 90%, center on, match:initial_class ^(anki)$, match:initial_title ^(Add-ons)$"
          "float on, size 90% 90%, center on, match:initial_class ^(anki)$, match:initial_title ^(Leech Toolkit.*)$"

          "float on, size 90% 90%, center on, match:initial_class ^(org.quickshell)$, match:initial_title ^(Settings)$"

          "border_color rgb(${config.rosePine.main.iris}), match:float true"
          "border_color rgb(${config.rosePine.main.pine}), match:fullscreen true"
          "border_color rgb(${config.rosePine.main.rose}) rgb(${config.rosePine.main.rose}), match:pin true"

          "center on, match:float true"

          "max_size 70% 70%, match:float true"

          "float on, center on, size 70% 70%, match:class ^(firefox)$, match:initial_title ^(Sign in - Google Accounts.*)$"

          "float on, center on, size 90% 70%, match:class ^(firefox)$, match:initial_title ^(Library)$"

          "float on, center on, size 38% 87%, move 60% 5%, match:class ^(tridactyl)$"
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
