{ inputs, config, lib, ... }:
let
  cfg = config.desktop.hyprland.pyprland;
in
{
  imports = [
    ./dropdowns/btm.nix
    ./dropdowns/claude.nix
    ./dropdowns/hmOptions.nix
    ./dropdowns/nixpkgs.nix
    ./dropdowns/noogle.nix
    ./dropdowns/spotube.nix
  ];

  options.desktop.hyprland.pyprland.enable = lib.mkEnableOption "enable pyprland";

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.pyprland.packages.x86_64-linux.default
    ];
    xdg.configFile."pyprland.toml" = {
      target = "hypr/pyprland.toml";
      text = /*toml*/ ''
        [pyprland]
        plugins = [ "scratchpads" ]

        [ workspaces_follow_focus ]
        max_workspaces = 9
      '';
    };
  };
}
