{ pkgs, ... }: {
  imports = [
    ./window-rules.nix
    ./keybinds.nix
    ./theme.nix
  ];

  wayland.windowManager.hyprland = {
    # extraConfig = ''
    #   env = LIBVA_DRIVER_NAME, nvidia
    #   env = XDG_SESSION_TYPE, wayland
    #   env = GBM_BACKEND, nvidia-drm
    #   env = __GLX_VENDOR_LIBRARY_NAME, nvidia
    #   env = WLR_NO_HARDWARE_CURSORS, 1
    # '';
    settings = {
      input = {
        "kb_layout" = "us";
        "kb_options" = "caps:escape";
        "follow_mouse" = "1";
      };

      misc = {
        "disable_hyprland_logo" = "true";
        "disable_splash_rendering" = "true";
        "mouse_move_enables_dpms" = "true";
        "key_press_enables_dpms" = "false";
        "enable_swallow" = "true";
        "swallow_regex" = [
          "kitty"
        ];
      };
    };
  };
}
