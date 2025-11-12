{ lib, config, ... }:
let
  cfg = config.opts.communications;
in
{
  imports = [
    ./discord.nix
    ./discover-overlay.nix
    ./thunderbird.nix
    ./vesktop.nix
  ];

  options.opts.communications = {
    enable = lib.mkEnableOption "enable communications";
  };

  config = lib.mkIf cfg.enable {
    opts.communications = {
      thunderbird.enable = true;
      vesktop.enable = true;
    };
  };
}
