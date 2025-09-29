{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.neb.desktop.utilities.ghostty;

  # smear_fade_src = pkgs.fetchurl {
  #   url = "https://raw.githubusercontent.com/KroneCorylus/ghostty-shader-playground/refs/heads/main/shaders/cursor_smear_fade.glsl";
  #   hash = "sha256-2XGq3qIGT7LGsHiFZbGmci/M8CkTGNBDHGImGkKnoCk=";
  # };
  # smear_fade_patched_text =
  #   lib.replaceStrings
  #     [
  #       "const vec4 TRAIL_COLOR = vec4(1., 1., 0., 1.0);"
  #     ]
  #     [
  #       # NOTE: foam (works)
  #       # "const vec4 TRAIL_COLOR = vec4(0.612, 0.812, 0.847, 1.0);"
  #       # NOTE: iris
  #       "const vec4 TRAIL_COLOR = vec4(0.769, 0.655, 0.906, 1.0);"
  #     ]
  #     (builtins.readFile smear_fade_src);
  #
  # smear_fade_patched = pkgs.writeText "cursor_smear_fade.glsl" smear_fade_patched_text;
  #
in
{
  options.neb.desktop.utilities.ghostty = {
    enable = lib.mkEnableOption "enable ghostty";

    # If true, run Ghostty with GL 4.3 advertised (fixes GTK context issue).
    forceGL43 = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Wrap ghostty with MESA_GL_VERSION_OVERRIDE=4.3 and MESA_GLSL_VERSION_OVERRIDE=430.";
    };

    # Name of the wrapper binary (so you can keep the original `ghostty` intact if you want).
    wrapperName = lib.mkOption {
      type = lib.types.str;
      default = "ghostty-ogl43";
      description = "Name of the wrapped launcher binary.";
    };

    # Also install a desktop entry that uses the wrapper.
    desktopEntry = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install an xdg desktop entry that launches the wrapped Ghostty.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.tmux.terminal = "xterm-ghostty";

    programs.ghostty = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      clearDefaultKeybinds = true;
      installBatSyntax = true;
      installVimSyntax = true;

      settings = lib.mkForce {
        theme = "custom-rose-pine";
        font-family = "IBM Plex Mono";
        font-style = "Medium";
        font-style-italic = "Medium Italic";
        font-feature = "-ss01";

        window-decoration = false;
        adjust-cursor-thickness = 1;

        clipboard-read = "allow";
        clipboard-write = "allow";
        clipboard-trim-trailing-spaces = true;
        copy-on-select = true;
        confirm-close-surface = false;
        # custom-shader = [
        #   "${smear_fade_patched}"
        # ];
        custom-shader-animation = "always";
      };

      themes = lib.mkForce {
        custom-rose-pine = {
          background = "${config.rosePine.main.base}";
          cursor-color = "908caa";
          foreground = "e0def4";
          palette = [
            "0=#191724"
            "1=#eb6f92"
            "2=#31748f"
            "3=#ebbcba"
            "4=#c4a7e7"
            "5=#f6c177"
            "6=#9ccfd8"
            "7=#e0def4"
            "8=#6e6a86"
            "9=#eb6f92"
            "10=#${config.rosePine.main.pine}"
            "11=#ebbcba"
            "12=#9ccfd8"
            "13=#908caa"
            "14=#c4a7e7"
            "15=#524f67"
          ];
          selection-background = "353749";
          selection-foreground = "f6c177";
        };
      };
    };

    # Wrapper that sets the Mesa overrides (GPU path, not llvmpipe).
    home.packages = lib.mkIf cfg.forceGL43 [
      (pkgs.writeShellScriptBin cfg.wrapperName ''
        #!${pkgs.runtimeShell}
        exec env \
          MESA_GL_VERSION_OVERRIDE=4.3 \
          MESA_GLSL_VERSION_OVERRIDE=430 \
          ghostty "$@"
      '')
    ];

    # Optional desktop entry pointing to the wrapper (keeps the original entry untouched).
    xdg.desktopEntries = lib.mkIf (cfg.forceGL43 && cfg.desktopEntry) {
      ghostty-ogl43 = {
        name = "Ghostty (OpenGL 4.3)";
        genericName = "Terminal";
        comment = "Ghostty launched with GL 4.3 override";
        exec = "${cfg.wrapperName}";
        terminal = false;
        type = "Application";
        categories = [
          "System"
          "TerminalEmulator"
        ];
        icon = "ghostty";
        # If you like tmux auto-attach:
        # exec = "${cfg.wrapperName} -e tmux new-session -A -s main";
      };
    };

    # If you want Hyprland binds to the wrapper (uncomment your TODO and swap command):
    wayland.windowManager.hyprland.settings.bind = [
      "$mainMod, Return, exec, ${cfg.wrapperName} -e tmux new-session -A -s main"
      "$mainMod + SHIFT, Return, exec, hyprctl dispatch exec \"[float; size 80% 80%; center 1; animation slide] ${cfg.wrapperName}\""
    ];
  };
}
