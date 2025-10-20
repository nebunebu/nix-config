{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.desktop.utilities;
in
{
  imports = [
    ./foot.nix
    ./fuzzel
    ./ghostty.nix
    ./kitty.nix
    ./pavucontrol.nix
  ];

  options.neb.desktop.utilities = {
    enable = lib.mkEnableOption "enable desktop utilities";
  };

  config = lib.mkIf cfg.enable {
    neb.desktop.utilities = {
      foot.enable = true;
      fuzzel.enable = true;
      ghostty.enable = true;
      kitty.enable = true;
      pavucontrol.enable = true;
    };
  };
}
