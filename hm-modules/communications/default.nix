{ lib, config, ... }:
let
  cfg = config.hm.communications;
in
{
  imports = [
    ./discord.nix
    ./discover-overlay.nix
    ./thunderbird.nix
    ./vesktop.nix
  ];

  options.hm.communications = {
    enable = lib.mkEnableOption "enable communications";
  };

  config = lib.mkIf cfg.enable {
    hm.communications = {
      thunderbird.enable = true;
      vesktop.enable = true;
      discord.enable = true;
      discover-overlay.enable = true;
    };
  };
}
