{ lib, config, ... }:
let
  cfg = config.opts.terminal-emulators;
in
{
  imports = [
    ./foot.nix
    ./ghostty.nix
    ./kitty.nix
  ];

  options.opts.terminal-emulators = {
    enable = lib.mkEnableOption "enable terminal emulators";
  };

  config = lib.mkIf cfg.enable {
    opts.terminal-emulators = {
      foot.enable = true;
      ghostty.enable = true;
      kitty.enable = true;
    };
  };
}
