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
      AQ_DRM_DEVICES = "/dev/dri/card1";
    };

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd = {
        enable = true;
        # variables = [ "-all" ];
      };

      extraConfig = ''
        source = ~/.config/hypr/dms/layout.conf
        # source = ~/.config/hypr/dms/outputs.conf

        env = QT_QPA_PLATFORM,wayland
        env = ELECTRON_OZONE_PLATFORM_HINT,auto
        env = QT_QPA_PLATFORMTHEME,gtk3
        env = QT_QPA_PLATFORMTHEME_QT6,gtk3
        env = MESA_GL_VERSION_OVERRIDE,4.3
        env = MESA_GLSL_VERSION_OVERRIDE,430

        # layerrule = noanim, ^(dms)$

        decoration {
            shadow {
                enabled = false
                range = 30
                render_power = 5
                offset = 0 5
                color = rgba(00000070)
            }
        }

        # Opacity for inactive windows
        windowrulev2 = opacity 0.9 0.9, floating:0, focus:0

        # GNOME apps
        windowrulev2 = rounding 12, class:^(org\.gnome\.)
        windowrulev2 = noborder, class:^(org\.gnome\.)

        # Terminal apps - no borders
        windowrulev2 = noborder, class:^(org\.wezfurlong\.wezterm)$
        windowrulev2 = noborder, class:^(Alacritty)$
        windowrulev2 = noborder, class:^(zen)$
        windowrulev2 = noborder, class:^(com\.mitchellh\.ghostty)$
        windowrulev2 = noborder, class:^(kitty)$



        # Floating windows
        windowrulev2 = float, class:^(gnome-calculator)$
        windowrulev2 = float, class:^(blueman-manager)$
        windowrulev2 = float, class:^(org\.gnome\.Nautilus)$

        # Open DMS windows as floating by default
        windowrulev2 = float, class:^(org.quickshell)$

        # Animations
        # layerrule = animation slide right, dms:control-center
        # layerrule = animation slide top, dms:workspace-overview
        # You can find all available animations here: https://wiki.hypr.land/Configuring/Animations/#animation-tree

        # Blur
        # You can use regex like so to apply a rule to multiple layer
        # You can also use variables
        # $blur_layer = dms:(color-picker|clipboard|spotlight|settings)
        # layerrule = blur, $blur_layer 

        # Dim (if you prefer a dim instead of a blur effect)
        # layerrule = dimaround, $blur_layer


        exec-once = hypr-start
        exec-once = tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"
        debug:disable_logs = true
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
