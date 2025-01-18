{ lib, config, ... }:
let
  cfg = config.neb.desktop.utilities.ghostty;
in
{
  options.neb.desktop.utilities.ghostty = {
    enable = lib.mkEnableOption "enable ghostty";
  };
  config = lib.mkIf cfg.enable {

    # TODO: make this an option
    wayland.windowManager.hyprland.settings.bind = [
      "$mainMod, Return, exec, ghostty -e tmux new-session -A -s main"
      "$mainMod + SHIFT, Return, exec, hyprctl dispatch exec \"[float; size 80% 80%; center 1; dimaround; animation slide] ghostty\""
    ];

    # TODO: make this an option
    programs.tmux.terminal = "xterm-ghostty";

    programs.ghostty = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      clearDefaultKeybinds = false;
      installBatSyntax = true;
      installVimSyntax = true;
      settings = lib.mkForce {
        # TODO: add keybinds

        theme = "custom-rose-pine";
        font-family = "IBM Plex Mono";
        font-style = "Medium";
        font-style-italic = "Medium Italic";
        font-feature = "-ss01";

        window-decoration = false;
        adjust-cursor-thickness = 1;

        # link-url = true;
        # selection-invert-fg-bg = false;

        # Clipboard
        clipboard-read = "allow";
        clipboard-write = "allow";
        clipboard-trim-trailing-spaces = true;
        copy-on-select = true;
        confirm-close-surface = false;
      };
      themes = {
        custom-rose-pine = {
          background = "191724";
          cursor-color = "908caa";
          foreground = "e0def4";
          palette = [
            "0=#191724"
            "1=#eb6f92"
            "2=#31748f"
            "3=#9ccfd8"
            "4=#c4a7e7"
            "5=#f6c177"
            "6=#ebbcba"
            "7=#e0def4"
            # "8=#585b70"
            # "9=#eb6f92"
            # "10=#31748f"
            # "11=#ebbcba"
            # "12=#9ccfd8"
            # "13=#f6c177"
            # "14=#c4a7e7"
            # # "15=#a6adc8"
          ];
          selection-background = "353749";
          selection-foreground = "f6c177";
        };
      };
    };
  };
}
