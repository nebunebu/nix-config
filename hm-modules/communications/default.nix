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
      thunderbird.enable = lib.mkDefault true;
      vesktop.enable = lib.mkDefault true;
      discord.enable = lib.mkDefault true;
      discover-overlay.enable = lib.mkDefault true;
    };
  };
}
