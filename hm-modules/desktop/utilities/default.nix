{ lib
, config
, ...
}:
let
  cfg = config.neb.shell;
in
{
  imports = [
    ./foot.nix
    ./fuzzel
    ./ghostty.nix
    ./kitty.nix
    ./pavucontrol.nix
    ./astal.nix
    ./hyprpanel
  ];

  options.neb.desktop.utilities = {
    enable = lib.mkEnableOption "enable desktop utilities";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.utilities = {
      foot.enable = false;
      fuzzel.enable = true;
      ghostty.enable = true;
      kitty.enable = false;
      pavucontrol.enable = true;
    };
  };
}
