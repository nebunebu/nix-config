[
  {
    name = "hyprland";
    bindings = [
      {
        name = "exit hyprland";
        key = "SUPER + SHIFT + Q";
      }
      {
        name = "exit hyprland";
        key = "SUPER + SHIFT + Q";
      }
    ];
    children = [
      {
        name = "windows";
        bindings = [
          {
            name = "move to mon:DP-1";
            key = "SUPER + SHIFT + N";
          }
          {
            name = "move to mon:DP-2";
            key = "SUPER + SHIFT + M";
          }
          {
            name = "kill active window";
            key = "SUPER + X";
          }
          {
            name = "full screen";
            key = "SUPER + M";
          }
          {
            name = "full screen";
            key = "SUPER + SHIFT + M";
          }
          {
            name = "toggle floating";
            key = "SUPER + F";
          }
          {
            name = "move window left";
            key = "SUPER + SHIFT + H";
          }
          {
            name = "move window right";
            key = "SUPER + SHIFT + L";
          }
          {
            name = "move window up";
            key = "SUPER + SHIFT + K";
          }
          {
            name = "move window down";
            key = "SUPER + SHIFT + J";
          }
          {
            name = "move focus left";
            key = "SUPER + H";
          }
          {
            name = "move focus right";
            key = "SUPER + L";
          }
          {
            name = "move focus up";
            key = "SUPER + K";
          }
          {
            name = "move focus down";
            key = "SUPER + J";
          }
        ];
      }
      {
        name = "launch application";
        bindings = [
          {
            name = "hyprpicker";
            key = "SUPER + C";
          }
          {
            name = "firefox";
            key = "SUPER + I";
          }
          {
            name = "ghostty in tmux";
            key = "SUPER + RETURN";
          }
          {
            name = "ghostty float";
            key = "SUPER + SHIFT + RETURN";
          }
        ];
      }
      {
        name = "fuzzel menus";
        bindings = [
          {
            name = "screen-capture";
            key = "SUPER + ALT_R";
          }
          {
            name = "power-menu";
            key = "SUPER + INSERT";
          }
          {
            name = "cliphist-menu";
            key = "SUPER + V";
          }
          {
            name = "application-menu";
            key = "SUPER + P";
          }
        ];
      }
      {
        name = "scratchpads";
        bindings = [
          {
            name = "bottom";
            key = "ALT_L + b";
          }
          {
            name = "crib";
            key = "ALT_L + c";
          }
          {
            name = "spotube";
            key = "ALT_L + s";
          }
          {
            name = "obsidisan";
            key = "ALT_L + o";
          }
        ];
      }
      {
        name = "submaps";
        bindings = [
          {
            name = "passkey";
            key = "ALT_L + v";
          }
          {
            name = "resize";
            key = "ALT_L + r";
          }
        ];
      }
    ];
  }
]
