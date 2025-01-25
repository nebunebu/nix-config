{ lib
, config
, ...
}:
let
  cfg = config.neb.desktop.utilities;
in
{
  imports = [
    ./anyrun.nix
    ./astal.nix
    ./foot.nix
    ./fuzzel
    ./ghostty.nix
    ./hyprpanel
    ./kitty.nix
    ./pavucontrol.nix
  ];

  options.neb.desktop.utilities = {
    enable = lib.mkEnableOption "enable desktop utilities";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.utilities = {
      anyrun.enable = true;
      foot.enable = false;
      fuzzel.enable = false;
      ghostty.enable = true;
      kitty.enable = false;
      pavucontrol.enable = true;
    };
  };
}
