{ pkgs
, inputs
, ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".hyprexpo
    ];
    settings = {
      bind = [
        "$mainMod, e, hyprexpo:expo, toggle"
        # "$mainMod, ALT_R, exec, screen-capture"
      ];
      "plugin:hyprexpo" = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(111111)";
        workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

        enable_gesture = true; # laptop touchpad
        gesture_fingers = 3; # 3 or 4
        gesture_distance = 300; # how far is the "max"
        gesture_positive = true; # positive =
      };
    };
  };
}
