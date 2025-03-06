{
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.neb.desktop.window-managers.hyprland.pyprland;
in
{
  imports = [
    ./dropdowns/btm.nix
    ./dropdowns/crib.nix
    ./dropdowns/claude.nix
    ./dropdowns/hmOptions.nix
    ./dropdowns/nixpkgs.nix
    ./dropdowns/noogle.nix
    ./dropdowns/obsidian.nix
    ./dropdowns/spotube.nix
  ];

  options.neb.desktop.window-managers.hyprland.pyprland.enable = lib.mkEnableOption "enable pyprland";

  config = lib.mkIf cfg.enable {
    home.packages = [ inputs.pyprland.packages.x86_64-linux.default ];

    wayland.windowManager.hyprland.settings.exec-once = [
      "${inputs.pyprland.packages.x86_64-linux.default}/bin/pypr"
    ];

    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = # toml
        ''
          [pyprland]
          plugins = [ "scratchpads" ]

          [ workspaces_follow_focus ]
          max_workspaces = 9
        '';
    };
  };
}
