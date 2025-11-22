{ config, lib, ... }:
let
  cfg = config.nos.networking;
in
{
  options.nos.networking = {
    enable = lib.mkEnableOption "enable networking configuration";
  };

  config = lib.mkIf cfg.enable {
    # networking.wireless.enable = true;
    networking.networkmanager = {
      enable = true;
    };
    programs = {
      zsh.enable = true;
      mtr.enable = true;
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
