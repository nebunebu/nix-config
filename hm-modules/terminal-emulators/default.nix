{ lib, config, ... }:
let
  cfg = config.hm.terminal-emulators;
in
{
  imports = [
    ./foot.nix
    ./ghostty.nix
    ./kitty.nix
  ];

  options.hm.terminal-emulators = {
    enable = lib.mkEnableOption "enable terminal emulators";
  };

  config = lib.mkIf cfg.enable {
    hm.terminal-emulators = {
      foot.enable = true;
      ghostty.enable = true;
      kitty.enable = true;
    };
  };
}
