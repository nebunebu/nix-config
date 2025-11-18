{
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.hm.window-managers.hyprland.pyprland;
in
{
  imports = [
    ./dropdowns/btm.nix
    ./dropdowns/hmOptions.nix
    ./dropdowns/nixpkgs.nix
    ./dropdowns/noogle.nix
  ];

  options.hm.window-managers.hyprland.pyprland.enable = lib.mkEnableOption "enable pyprland";

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
