{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "float, class:^(mpv)$"
      "center, class:^(mpv)$"
      "animation popin, class:^(mpv)$"
      "size 85%, class:^(mpv)$"

      "float, class:^(firefox)$"
      "center, class:^(firefox)$"
      "animation popin, class:^(firefox)$"
      "size 85%, class:^(firefox)$"

      "float, class:^(thunderbird)$, title:^(Message Filters)$"
      "center, class:^(thunderbird)$, title:^(Message Filters)$"
      "animation popin, class:^(thunderbird)$, title:^(Message Filters)$"
      "size 70%, class:^(thunderbird)$, title:^(Message Filters)$"
    ];
  };
}
