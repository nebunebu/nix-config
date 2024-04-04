{ pkgs, ... }:
{
  # discord
  # discourse
  # docs - hyprland, nixpkgs, etc
  # jellyfinmediaplayer
  # nitch
  xdg.configFile."pyprland.toml" = {
    target = "hypr/pyprland.toml";
    text = /*toml*/ ''
      [pyprland]
      plugins = [ "scratchpads" ]

      [ workspaces_follow_focus ]
      max_workspaces = 9

      [scratchpads.btm]
      command = "kitty --class=\"kitty-btm\" zsh -c \"btm\""
      animation = "fromTop"
      class = "kitty-btm"
      lazy = true
      size = "75% 65%"

      [scratchpads.spo]
      command = "${pkgs.spotube}/bin/spotube"
      animation = "fromTop"
      class = "spotube"
      lazy = true
      size = "80% 80%"

      [scratchpads.noogle]
      command = "firefox -P noogle"
      animation = "fromTop"
      lazy = true
      size = "80% 80%"

      [scratchpads.nixpkgs]
      command = "firefox -P nixpkgs"
      animation = "fromTop"
      lazy = true
      size = "80% 80%"

      [scratchpads.hm-options]
      command = "firefox -P hm-options"
      animation = "fromTop"
      lazy = true
      size = "80% 80%"

      [scratchpads.lichess]
      command = "firefox -P lichess"
      animation = "fromTop"
      lazy = true
      size = "80% 80%"
    '';
  };
}
